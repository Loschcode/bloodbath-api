namespace :cron do
  desc "it will call the API to get the latest coins available on the market and insert them on the database"
  task refresh_market_coins: :environment do
    Tasks::Cron::RefreshMarketCoins.new.perform
  end
end

namespace :cron do
  desc "it will broadcast the current market coin data to the users connected to it"
  task broadcast_market_coins: :environment do
    Tasks::Cron::BroadcastMarketCoins.new.perform
  end
end
