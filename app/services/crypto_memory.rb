class CryptoMemory
  attr_reader :user, :currency

  def initialize(user:, currency:)
    @user = user
    @currency = currency
  end

  def solve
    if currency_trace.base_value
      currency_trace.update!(current_value: crypto_api.current_value)
    else
      currency_trace.update!(base_value: crypto_api.current_value, current_value: crypto_api.current_value)
    end
    currency_trace
  end

  def reset
    currency_trace.destroy
  end

  private

  def currency_trace
    @currency_trace ||= begin
      CurrencyTrace.where(currency: currency, user: user).first || CurrencyTrace.create(currency: currency, user: user)
    end
  end

  def crypto_api
    @crypto_api ||= CryptoApi.new(currency: currency)
  end

end
