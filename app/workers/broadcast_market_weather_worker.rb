require "#{Rails.root}/lib/tasks/cron/broadcast_market_weather"

class BroadcastMarketWeatherWorker
  include Sidekiq::Worker

  def perform(*args)
    Tasks::Cron::BroadcastMarketWeather.new.perform
  end
end
