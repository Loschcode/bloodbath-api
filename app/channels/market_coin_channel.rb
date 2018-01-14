class MarketCoinChannel < ApplicationCable::Channel

  def refresh_market_coin
    broadcast action: 'refresh_market_coin', market_coin: market_coin
  end

  def ping(data)
    broadcast action: 'pong'
    # refresh_market_coin
  end

  private

  def subscribed
    stream_from channel
  end

  def channel
    "market-coin-#{market_coin.id}"
  end

  def market_coin
    # TODO : deal with failure
    @market_coin ||= MarketCoin.find(params[:id])
  end

  def broadcast(data)
    ActionCable.server.broadcast channel, data
  end
end
