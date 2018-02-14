require 'cryptocompare'

class CoinApiFinder
  attr_reader :coin_codes, :coins, :currencies

  BASE_CURRENCY = 'BTC'.freeze

  def initialize(coin_codes:)
    @coin_codes = coin_codes
    @coins = [coin_codes, BASE_CURRENCY].flatten
    @currencies = [BASE_CURRENCY].push(base_currencies).flatten
  end

  def current(code)
    return false unless coins_data(code)
    # wrong return from API, it happens sometimes with BTC
    return false if coins_data(code)['MKTCAP'] == 0

    current = {
      price: coins_data(code)['PRICE'],
      market_cap: coins_data(code)['MKTCAP'],
      day_open: coins_data(code)['OPEN24HOUR'],
      day_high: coins_data(code)['HIGH24HOUR'],
      day_low: coins_data(code)['LOW24HOUR'],
    }

    # if we look for the main data of BTC
    # we don't actually give the data out
    current.delete(:price) if code == BASE_CURRENCY

    current
  end

  def coins_data(code)
    return false unless raw[code]

    raw[code][BASE_CURRENCY]
  end

  def base_currencies_data
    raw[BASE_CURRENCY]
  end

  def raw
    fetch['RAW']
  end

  def error?
    !raw
  end

  private

  def base_currencies
    @base_currencies ||= BaseCurrency.pluck(:code)
  end

  def fetch
    @fetch ||= Cryptocompare::Price.full(coins, currencies)
  end

end
