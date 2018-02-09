require "#{Rails.root}/lib/tasks/cron/refresh_base_currencies"

class RefreshBaseCurrenciesWorker
  include Sidekiq::Worker

  def perform(*args)
    Tasks::Cron::RefreshBaseCurrencies.new.perform
  end
end
