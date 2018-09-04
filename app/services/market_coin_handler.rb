class MarketCoinHandler
  attr_reader :coin_ids

  def initialize(coin_ids: nil)
    @coin_ids = coin_ids
  end

  def refresh_and_fetch
    return false unless market_coins.present?
    refresh
    market_coins
  end

  private

  def refresh
    unless finder.error?
      market_coins.each do |market_coin|
        next unless finder.current(market_coin.code)
        market_coin.update! finder.current(market_coin.code)
        # in case of current all time high we basically set the price
        # as all time high.
        if market_coin.all_time_high < market_coin.price
          market_coin.update! all_time_high: market_coin.price
        end
      end

      base_currencies_handler.refresh(finder.base_currencies_data)
    end
  end

  def market_coins
    @market_coins ||= begin
      if from_coin_code?
        MarketCoin.where(code: coin_ids.map(&:upcase)).all
      else
        MarketCoin.where(id: coin_ids).all
      end
    end
  end

  def from_coin_code?
    coin_ids.first&.to_i == 0
  end

  def coin_codes
    market_coins.map(&:code)
  end

  def finder
    @finder ||= CoinApiFinder.new(coin_codes: coin_codes)
  end

  def base_currencies_handler
    @base_currencies_handler ||= BaseCurrenciesHandler.new
  end
end
