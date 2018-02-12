require 'cryptocompare'

class CryptoApiFinder
  attr_reader :coin_name, :currencies

  BASE_CURRENCY = 'BTC'.freeze

  def initialize(coin_name:, currencies:nil)
    @coin_name = coin_name
    @currencies = currencies || [BASE_CURRENCY]
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

  def raw
    fetch['RAW']
  end

  def error?
    fetch["Response"] == "Error" || !raw[coin_name]
  end

  private

  def data
    @data ||= raw[coin_name][currencies.first]
  end

  def fetch
    @fetch ||= Cryptocompare::Price.full(coin_name, currencies)
  end

end
