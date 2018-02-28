class MarketWeatherChannel < ApplicationCable::Channel

  private

  def subscribed
    super
    stream_from channel
  end

  def unsubscribed
    super
  end

  # end of management user following

  def channel
    "market-weather"
  end

  def broadcast(data)
    ActionCable.server.broadcast channel, data
  end
end
