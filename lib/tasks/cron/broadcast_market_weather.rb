# we broadcast through sockets the market weather
# dead simple system for now
class Tasks::Cron::BroadcastMarketWeather

  def initialize
    puts "Task initialized."
  end

  def perform
    2.times do |time|
      puts "Iteration #{time}"
      market_weather = MarketWeatherHandler.new.refresh_and_fetch
      # now we broadcast to the page
      ActionCable.server.broadcast "market-weather", action: 'show', market_weather: market_weather
      puts "MarketWeather was broadcast."
      sleep 25.0
    end
    puts "Task performed."
  end

  private

end
