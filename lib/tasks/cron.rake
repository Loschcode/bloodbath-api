namespace :cron do
  desc "It will call the API to get the latest coins available on the market and insert them in the database"
  task refresh_market_coins: :environment do
    Tasks::Cron::RefreshMarketCoins.new.perform
  end
end

namespace :cron do
  desc "It will call the API to get all the details of each coin and insert them in the database"
  task fill_empty_market_coins: :environment do
    Tasks::Cron::FillEmptyMarketCoins.new.perform
  end
end

namespace :cron do
  desc "It will call the API to get all the details of each coin and refresh / add them in the database"
  task refill_market_coins: :environment do
    Tasks::Cron::FillEmptyMarketCoins.new.perform
  end
end

namespace :cron do
  desc "It will refresh the base currency and set the correct rates from the API"
  task refresh_base_currencies: :environment do
    Tasks::Cron::RefreshBaseCurrencies.new.perform
  end
end

namespace :cron do
  desc "It will broadcast the current market coin data to the users connected to it"
  task broadcast_market_coins: :environment do
    Tasks::Cron::BroadcastMarketCoins.new.perform
  end
end

namespace :cron do
  desc "It will refresh the cryspibois"
  task refresh_cryspibois: :environment do
    Tasks::Cron::RefreshCryspibois.new.perform
  end
end
