require 'cryptocompare'

class CryptoHandler
  attr_reader :currency

  COMPARED_CURRENCY = 'USD'.freeze

  def initialize(currency:)
    @currency = currency
  end

  def current_value
    raw_value[currency][COMPARED_CURRENCY]
  end

  private

  def raw_value
    @raw ||= Cryptocompare::Price.find(currency, COMPARED_CURRENCY)
  end

end
