class CryptoMemory
  attr_reader :request, :session, :currency

  def initialize(request:, currency:)
    @request = request
    @session = request.session
    @currency = currency
  end

  def solve
    if recover
      recover
    else
      setup
    end
  end

  private

  def crypto_api
    @crypto_api ||= CryptoApi.new(currency: currency)
  end

  def setup
    session[:currencies][:current_value][currency] = crypto_api.current_value
  end

  def recover
    session[:currencies][:current_value][currency]
  end

end
