require "#{Rails.root}/lib/tasks/cron/refresh_market_coins"

class RefreshMarketCoinsWorker
  include Sidekiq::Worker

  def perform(*args)
    Tasks::Cron::RefreshMarketCoins.new.perform
  end
end
