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

  def day_open
    data['OPEN24HOUR']
  end

  def day_high
    data['HIGH24HOUR']
  end

  def day_low
    data['LOW24HOUR']
  end

  private

  def data
    @data ||= fetch['RAW'][currency][COMPARED_CURRENCY]
  end

  def fetch
    @fetch ||= Cryptocompare::Price.full(currency, COMPARED_CURRENCY)
  end

end
