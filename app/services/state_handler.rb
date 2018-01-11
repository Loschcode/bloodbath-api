class StateHandler
  attr_reader :currency

  def initialize(currency:)
    @currency = currency
  end

  def refresh_and_fetch
    refresh
    currency_state
  end

  private

  def refresh
    currency_state.update!(last_state)
  end

  def last_state
    {
      market_cap: crypto_api_finder.market_cap,
      price: crypto_api_finder.price
    }
  end

  def currency_state
    @currency_state ||= CurrencyState.where(symbol: currency).first
  end

  def crypto_api_finder
    @crypto_api_finder ||= CryptoApiFinder.new(currency: currency)
  end

end
