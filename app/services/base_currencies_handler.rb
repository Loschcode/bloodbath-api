class BaseCurrenciesHandler
  attr_reader :data

  def initialize
  end

  def refresh(data)
    puts "We refresh the exchange rates"

    # we will now refresh all the exchange rates
    BaseCurrency.all.each do |base_currency|
      puts "We will refresh #{base_currency.code}"
      exchange_rate = data[base_currency.code]['PRICE']

      puts "New exchange rate #{base_currency.code} is #{exchange_rate}"
      base_currency.update!(exchange_rate: exchange_rate)
    end

    puts "Task performed."
  end
end
