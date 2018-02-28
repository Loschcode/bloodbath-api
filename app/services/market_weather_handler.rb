# very simple algorithm to get the current weather depending the `market_coins` selected
class MarketWeatherHandler

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
    @market_coins ||= MarketCoin.order(rank: :asc).limit(100)
  end

  def market_weather
    variation = 0
    quantities = 0

    market_coins.each do |market_coin|
      market_coin = MarketCoinSerializer.new(market_coin)
      if market_coin.object.market_cap > 0
        variation += market_coin.price_variation # * market_coin.object.market_cap
        quantities += 1 # market_coin.object.market_cap
      end
    end

    variation / quantities
  end
end
