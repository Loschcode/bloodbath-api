# we have a list of base currencies which need to be refreshed regularly
class Tasks::Cron::RefreshBaseCurrencies

  def initialize
    puts "Task initialized."
  end

  def perform
    puts "We ensure the base currencies .."
    ensure_base_currencies

    puts "We refresh the exchange rates"

    coin_name = 'BTC'

    # we base everything on BTC for now
    currencies = BaseCurrency.all.map(&:code)
    finder = CryptoApiFinder.new(coin_name: coin_name, currencies: currencies)

    if finder.error?
      puts "Error with the CryptoApiFinder."
      exit
    end

    # we will now refresh all the exchange rates
    BaseCurrency.all.each do |base_currency|
      puts "We will refresh #{base_currency.code}"
      # base = finder.raw[coin_name][exchange_base]['PRICE']
      # compared = finder.raw[coin_name][base_currency.code]['PRICE']
      # exchange_rate = base / compared

      exchange_rate = finder.raw[coin_name][base_currency.code]['PRICE']

      puts "New exchange rate #{coin_name} / #{base_currency.code} is #{exchange_rate}"
      base_currency.update!(exchange_rate: exchange_rate)
    end

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
