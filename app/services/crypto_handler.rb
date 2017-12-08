class CryptoHandler
  attr_reader :currency

  COMPARED_CURRENCY = 'USD'.freeze

  def initialize(currency: currency)
    @currency = currency
  end

  def rate
    binding.pry
  end

  private

    def data
      @data ||= JSON.parse(response)
    end

    def response
      @reponse ||= Net::HTTP.get(uri)
    end

    def uri
      URI(url)
    end

    def url
      "https://min-api.cryptocompare.com/data/price?fsym=#{currency}&tsyms=#{COMPARED_CURRENCY}"
    end
end
