require 'cryptocompare'

class CryptoApiFinder
  attr_reader :coin_name

  COMPARED_CURRENCY = 'USD'.freeze

  def initialize(coin_name:)
    @coin_name = coin_name
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
    @data ||= fetch['RAW'][coin_name][COMPARED_CURRENCY]
  end

  def fetch
    @fetch ||= Cryptocompare::Price.full(coin_name, COMPARED_CURRENCY)
  end

end
