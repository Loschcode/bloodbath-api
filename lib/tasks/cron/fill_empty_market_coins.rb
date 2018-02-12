# it will call the API to get the latest coins available
# on the market and insert them on the database
class Tasks::Cron::FillEmptyMarketCoins

  def initialize
    puts "Task initialized."
  end

  def perform
     Tasks::Cron::RefillMarketCoins.new.perform(empty_only: true)
  end

  private

end
