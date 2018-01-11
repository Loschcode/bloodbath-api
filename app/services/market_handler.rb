class MarketHandler
  attr_reader :currency

  def initialize(currency:)
    @currency = currency
  end

  def refresh_and_fetch
    refresh
    market_coin
  end

  private

  def refresh
    market_coin.update!(last_state)
  end

  def last_state
    {
      market_cap: crypto_api_finder.market_cap,
      price: crypto_api_finder.price
    }
  end

  def market_coin
    @market_coin ||= MarketCoin.where(symbol: currency).first
  end

  def crypto_api_finder
    @crypto_api_finder ||= CryptoApiFinder.new(currency: currency)
  end

end
