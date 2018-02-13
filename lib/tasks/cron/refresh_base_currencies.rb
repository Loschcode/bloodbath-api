# we have a list of base currencies which need to be refreshed regularly
class Tasks::Cron::RefreshBaseCurrencies
  BASE_CURRENCY = 'BTC'.freeze

  def initialize
    puts "Task initialized."
  end

  def perform
    puts "We ensure the base currencies .."
    ensure_base_currencies

    puts "We refresh the exchange rates"

    finder = CryptoApiFinder.new(coin_name: BASE_CURRENCY)

    if finder.error?
      puts "Error with the CryptoApiFinder."
      exit
    end

    # we go through the service to update all that
    BaseCurrenciesHandler.new.refresh(finder.base_currencies_data)

    puts "Task performed."
  end

  private

  def ensure_base_currencies
    [usd, eur, gbp].each do |currency|
      unless BaseCurrency.where(code: currency[:code]).first
        puts "Base Currency #{currency[:code]} does not exist ..."
        currency_base = BaseCurrency.new(currency)
        currency_base.save!(validate: false)
        puts "It is now stored."
      end
    end
  end

  def usd
    {
      symbol: '$',
      code: 'USD',
      full_name: 'United States Dollars',
      exchange_rate: 1.0
    }
  end

  def eur
    {
      symbol: '€',
      code: 'EUR',
      full_name: 'Euro',
      exchange_rate: 1.0
    }
  end

  def gbp
    {
      symbol: '£',
      code: 'GBP',
      full_name: 'Great Britain Pounds',
      exchange_rate: 1.0
    }
  end

end
