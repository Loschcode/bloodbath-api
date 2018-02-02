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
        MarketCoinHandler.new(coin_id: market_coin.code).refresh_and_fetch
        puts "[OK] MarketCoin `#{market_coin.code}` was filled"
      end
      puts "[KO] MarketCoin `#{market_coin.code}` already contains informations"
    end
    puts "Task performed."
  end

  private

end
