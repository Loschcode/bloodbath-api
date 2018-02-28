# refresh the rank from another API
class Tasks::Cron::RefreshMarketCoinsRanks

  def initialize
    puts "Task initialized."
  end

  def perform
    MarketCoin.all.each do |market_coin|
      if ranks[market_coin.symbol].present?
        market_coin.update(rank: ranks[market_coin.symbol])
        puts "[OK] MarketCoin `#{market_coin.code}` rank is #{market_coin.rank}"
      else
        puts "[KO] MarketCoin `#{market_coin.code}` has no rank"
      end
    end
    puts "Task performed."
  end

  private

  def ranks
    @ranks ||= begin
      fetch = MarketcoincapApi.new.fetch
      fetch.reduce({}) do |acc, coin|
        symbol = coin[:symbol]
        acc[symbol] = coin[:rank]
        acc
      end
    end
  end

end
