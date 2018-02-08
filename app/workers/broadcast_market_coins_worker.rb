require "#{Rails.root}/lib/tasks/cron/broadcast_market_coins"

class BroadcastMarketCoinsWorker
  include Sidekiq::Worker

  def perform(*args)
    Tasks::Cron::BroadcastMarketCoins.new.perform
  end
end
