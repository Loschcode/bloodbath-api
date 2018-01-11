class TrackingHandler
  attr_reader :user, :currency

  def initialize(user:, currency:)
    @user = user
    @currency = currency
  end

  def solve
    unless currency_tracking.base_price
      currency_tracking.update!(base_price: crypto_api_finder.price)
    end
    currency_tracking
  end

  def reset
    currency_tracking.destroy
  end

  private

  def currency_tracking
    @currency_tracking ||= begin
      CurrencyTracking.where(currency_state: currency_state, user: user).first || CurrencyTracking.create(currency_state: currency_state, user: user)
    end
  end

  def currency_state
    @currency_state ||= StateHandler.new(currency: currency).refresh_and_fetch
  end

  def crypto_api_finder
    @crypto_api_finder ||= CryptoApiFinder.new(currency: currency)
  end

end
