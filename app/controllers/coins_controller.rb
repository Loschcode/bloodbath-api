class CoinsController < ApplicationController
  attr_reader :currency, :market_coin, :coin_tracking

  before_action :authenticated?

  before_action :set_currency

  def index
  end

  def show
    @coin_tracking = tracking_handler.solve

    render json: {
      success: true,
      coin_tracking: coin_tracking,
      market_coin: market_coin,
    }
  end

  def destroy
    tracking_handler.reset
    render json: { success: true }
  end

  private

  def set_currency
    @currency = params[:id].upcase
  end

  def market_coin
    @market_coin ||= MarketHandler.new(currency: currency).refresh_and_fetch
  end

  def tracking_handler
    @tracking_handler ||= TrackingHandler.new(user: current_user, market_coin: market_coin)
  end

end
