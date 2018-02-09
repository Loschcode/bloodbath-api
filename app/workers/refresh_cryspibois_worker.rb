require "#{Rails.root}/lib/tasks/cron/refresh_cryspibois"

class RefreshCryspiboisWorker
  include Sidekiq::Worker

  def perform(*args)
    Tasks::Cron::RefreshCryspibois.new.perform
  end
end
