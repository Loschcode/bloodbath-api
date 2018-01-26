# we have a list of base currencies which need to be refreshed regularly
class Tasks::Cron::RefreshBaseCurrencies

  def initialize
    puts "Task initialized."
  end

  def perform
    puts "We ensure the base currencies .."
    ensure_base_currencies

    # crypto_api_list.each do |details|
    #   market_coin = MarketCoin.where(code: details[:symbol]).first
    #   if market_coin
    #     puts "[KO] MarketCoin `#{market_coin.code}` already present"
    #   else
    #     market_coin = MarketCoin.create(details.merge(empty_details))
    #     if market_coin.errors.empty?
    #       puts "[OK] MarketCoin `#{market_coin.code}` stored as `#{market_coin.id}`"
    #     else
    #       puts "[KO] MarketCoin `#{market_coin.code}` did not pass validation (`#{market_coin.errors.full_messages.join(', ')}`)"
    #     end
    #   end
    # end
    puts "Task performed."
  end

  private

  def ensure_base_currencies
    [usd, eur, gbp].each do |currency|
      unless CurrencyBase.where(code: currency[:code]).first
        puts "Base Currency #{currency.code} does not exist ..."
        currency_base = CurrencyBase.new(currency)
        currency_base.save!(validate: false)
        puts "It is now stored."
      end
    end
  end

  def usd
    {
      symbol: '$'
      code: 'USD',
      full_name: 'United States Dollars',
      exchange_rate: 1.0
    }
  end

  def eur
    {
      symbol: '€'
      code: 'EUR',
      full_name: 'Euro',
      exchange_rate: 1.0
    }
  end

  def gbp
    {
      symbol: '£'
      code: 'GBP',
      full_name: 'Great Britain Pounds',
      exchange_rate: 1.0
    }
  end

end
