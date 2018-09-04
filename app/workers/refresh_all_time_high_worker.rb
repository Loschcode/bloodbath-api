require "#{Rails.root}/lib/tasks/cron/refresh_all_time_high"

class RefreshAllTimeHighWorker
  include Sidekiq::Worker

  def perform(*args)
    Tasks::Cron::RefreshAllTimeHigh.new.perform
  end
end
