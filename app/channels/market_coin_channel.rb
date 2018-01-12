class MarketCoinChannel < ApplicationCable::Channel
  CHANNEL_NAME = 'market_coin'.freeze

  def subscribed
    stream_from CHANNEL_NAME
  end

  def send_message(data)
    binding.pry
    # to improve obviously
    ActionCable.server.broadcast CHANNEL_NAME, { message: 'test', name: 'yo' }
  end
end
