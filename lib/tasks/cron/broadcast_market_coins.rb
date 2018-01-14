# we broadcast through sockets all the market coins needed
# if there are users listening only, else it's ignored
class Tasks::Cron::BroadcastMarketCoins

  def initialize
    puts "Task initialized."
  end

  def perform
    market_coin_streams.each do |market_coin_stream|
      if market_coin_stream.users.count > 0
        market_coin = market_coin_stream.market_coin
        puts "`#{market_coin.id}`.`#{market_coin.symbol}` has `#{market_coin_stream.users.count}` users"
        ActionCable.server.broadcast "market-coin-#{market_coin.id}", action: 'refresh_market_coin', market_coin: market_coin
        puts "It was broadcast."
      end
    end
    puts "Task performed."
  end

  private

  def market_coin_streams
    @market_coin_streams ||= MarketCoinStream.all
  end

end
