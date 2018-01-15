class MarketCoinChannel < ApplicationCable::Channel


  def refresh_market_coin
    broadcast action: 'refresh_market_coin', market_coin: market_coin
  end

  def ping(data)
    broadcast action: 'pong'
    # refresh_market_coin
  end

  private

  # user following (would be abstracted in a concerns or something later on)

  def subscribed
    increase_current_users
    stream_from channel
  end

  def unsubscribed
    decrease_current_users
  end

  def increase_current_users
    market_coin_stream.users << current_user
    market_coin_stream.save
  end

  def decrease_current_users
    market_coin_stream.users.delete current_user
  end

  # end of management user following

  def channel
    "market-coin-#{market_coin.id}"
  end

  def market_coin
    @market_coin ||= MarketCoin.find(params[:id])
  end

  def market_coin_stream
    @market_coin_stream ||= begin
      market_coin.market_coin_stream || MarketCoinStream.create(market_coin: market_coin)
    end
  end

  def broadcast(data)
    ActionCable.server.broadcast channel, data
  end
end
