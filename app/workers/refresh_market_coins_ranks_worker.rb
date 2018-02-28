require "#{Rails.root}/lib/tasks/cron/refresh_market_coins_ranks"

class RefreshMarketCoinsRanksWorker
  include Sidekiq::Worker

  def perform(*args)
    Tasks::Cron::RefreshMarketCoinsRanks.new.perform
  end
end
