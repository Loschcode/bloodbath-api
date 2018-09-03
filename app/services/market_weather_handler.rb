# very simple algorithm to get the current weather depending the `market_coins` selected
class MarketWeatherHandler
  WEATHER_COINS = 20.freeze

  def initialize
  end

  def refresh_and_fetch
    refresh_market_coins
    market_weather
  end

  def fetch
    market_weather
  end

  private

  def refresh_market_coins
    MarketCoinHandler.new(coin_ids: market_coins.map(&:id)).refresh_and_fetch
  end

  def market_coins
    @market_coins ||= MarketCoin.order(rank: :asc).limit(WEATHER_COINS)
  end

  def market_weather
    variations = []
    quantities = 0

    market_coins.each do |market_coin|
      market_coin = MarketCoinSerializer.new(market_coin)
      if market_coin.object.market_cap > 0
        variations << market_coin.price_variation # * market_coin.object.market_cap
        quantities += 1 # market_coin.object.market_cap
      end
    end

    variations.sum / quantities
  end
end
