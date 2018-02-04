# it will call the API to get the latest coins available
# on the market and insert them on the database
class Tasks::Cron::FillEmptyMarketCoins

  def initialize
    puts "Task initialized."
  end

  def perform
    MarketCoin.all.each do |market_coin|
      # if the market coin was actually never updated
      # it means there is no data in it
      if market_coin.updated_at == market_coin.created_at
        # we use our handler
        refresh_market_coin = MarketCoinHandler.new(coin_id: market_coin.code).refresh_and_fetch
        # we check if it went well
        if refresh_market_coin
          puts "[OK] MarketCoin `#{market_coin.code}` was filled"
        else
          puts "[KO] MarketCoin `#{market_coin.code}` was not able to be filled."
        end
        next
      end
      puts "[KO] MarketCoin `#{market_coin.code}` already contains informations"
    end
    puts "Task performed."
  end

  private

end
