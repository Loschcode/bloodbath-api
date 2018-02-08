class BroadcastMarketCoinsWorker
  include Sidekiq::Worker

  def perform(*args)
    Tasks::Cron::BroadcastMarketCoins.new.perform
  end
end
