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
    current = {
      price: coins_data(code, 'PRICE'),
      market_cap: coins_data(code, 'MKTCAP'),
      day_open: coins_data(code, 'OPEN24HOUR'),
      day_high: coins_data(code, 'HIGH24HOUR'),
      day_low: coins_data(code, 'LOW24HOUR'),
    }

    # if we look for the main data of BTC
    # we don't actually give the data out
    current.delete(:price) if code == BASE_CURRENCY

    # we also delete any current returning false
    current.delete_if { |key, value| value == false }

    current
  end

  def coins_data(code, label=nil)
    return false unless raw[code]
    return raw[code][BASE_CURRENCY] unless label

    # we ensure it as a number
    data = raw[code][BASE_CURRENCY][label].to_f

    # for any corrupted data from the API
    # we will return false
    # it will later be processed and escaped if needed
    if data == 0.0
      false
    else
      data
    end
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
