require 'cryptocompare'

class CryptoApiFinder
  attr_reader :currency

  COMPARED_CURRENCY = 'USD'.freeze

  def initialize(currency:)
    @currency = currency
  end

  def price
    data['PRICE']
  end

  def market_cap
    data['MKTCAP']
  end

  private

  def data
    @data ||= fetch['RAW'][currency][COMPARED_CURRENCY]
  end

  def fetch
    @fetch ||= Cryptocompare::Price.full(currency, COMPARED_CURRENCY)
  end

end
