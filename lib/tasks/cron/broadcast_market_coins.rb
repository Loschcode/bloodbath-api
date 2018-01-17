# we broadcast through sockets all the market coins needed
# if there are users listening only, else it's ignored
# the task is launched every 1 minutes so
# we have to multiply it inside of here
class Tasks::Cron::BroadcastMarketCoins

  def initialize
    puts "Task initialized."
  end

  def perform
    5.times do |time|
      puts "Iteration #{time}"
      # we don't memoize the market coin stream because its data change through time
      # and this is spawn via CRON Tab and could make issues (multiple spawns without reload)
      MarketCoinStream.all.with_users.broadcastable.each do |market_coin_stream|
        market_coin = market_coin_stream.market_coin
        puts "`#{market_coin.id}`.`#{market_coin.symbol}` has `#{market_coin_stream.users.count}` users"
        # we refresh the coin from API
        market_coin = MarketHandler.new(currency: market_coin.symbol).refresh_and_fetch
        # now we broadcast to the page
        # NOTE : disable temporarily
        ctionCable.server.broadcast "market-coin-#{market_coin.id}", action: 'show', market_coin: market_coin
        # we update the last broadcast
        market_coin_stream.update!(last_broadcast_at: Time.now)
        # we confirm it
        puts "It was broadcast."
      end
      sleep 10.0
    end
    puts "Task performed."
  end

  private

end
