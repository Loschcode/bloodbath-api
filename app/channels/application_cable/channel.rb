module ApplicationCable
  class Channel < ActionCable::Channel::Base

    def subscribed
      # from theoretical previous connections
      stop_all_streams
    end

    def unsubscribed
      stop_all_streams
    end

  end
end
