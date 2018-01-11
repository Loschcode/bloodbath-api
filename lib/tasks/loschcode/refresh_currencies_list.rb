# it will call the API to get the latest currencies available
# on the market and insert them on the database
class Tasks::Loschcode::RefreshCurrenciesList

  def initialize
    puts "Task initialized."
  end

  def perform
    crypto_api_list.each do |details|
      currency_state = CurrencyState.where(details).first
      if currency_state
        puts "[KO] CurrencyState `#{currency_state.symbol}` already present"
      else
        currency_state = CurrencyState.create(details.merge({market_cap: 0.0, price: 0.0}))
        puts "[OK] CurrencyState `#{currency_state.symbol}` stored as `#{currency_state.id}`"
      end
    end
    puts "Task performed."
  end

  private

  def crypto_api_list
    @crypto_api_list ||= CryptoApiList.new.fetch
  end

end
