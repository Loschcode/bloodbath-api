class CurrencyStateChannel < ApplicationCable::Channel
  CHANNEL_NAME = 'currency_state'

  def subscribed
    stream_from CHANNEL_NAME
  end

  def send_message(data)
    binding.pry
    ActionCable.server.broadcast CHANNEL_NAME, { message: 'test', name: 'yo' }
  end
end
