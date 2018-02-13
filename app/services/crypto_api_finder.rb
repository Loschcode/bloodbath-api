require 'cryptocompare'

class CryptoApiFinder
  attr_reader :coin_name, :coins, :currencies

  BASE_CURRENCY = 'BTC'.freeze

  def initialize(coin_name:)
    @coin_name = coin_name
    @coins = [coin_name, BASE_CURRENCY]
    @currencies = [BASE_CURRENCY].push(base_currencies).flatten
  end

  def price
    if coin_name == BASE_CURRENCY
      1.0
    else
      main_data['PRICE']
    end
  end

  def market_cap
    main_data['MKTCAP']
  end

  def day_open
    main_data['OPEN24HOUR']
  end

  def day_high
    main_data['HIGH24HOUR']
  end

  def day_low
    main_data['LOW24HOUR']
  end

  def main_data
    @main_data ||= raw[coin_name][BASE_CURRENCY]
  end

  def base_currencies_data
    raw[BASE_CURRENCY]
  end

  def raw
    fetch['RAW']
  end

  def error?
    !raw || !raw[coin_name]
  end

  private

  def base_currencies
    @base_currencies ||= BaseCurrency.pluck(:code)
  end

  def fetch
    @fetch ||= Cryptocompare::Price.full(coins, currencies)
  end

end
