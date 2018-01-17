class CoinsController < ApplicationController
  attr_reader :currency, :market_coin, :market_coins, :coin_tracking

  before_action :authenticated?

  before_action :set_currency, except: [:index, :top, :search]

  def index
  end

  def top
    @market_coins = MarketCoin.order(market_cap: :desc).order(sort_order: :asc).limit(8)
    throw_success market_coins: market_coins
  end

  def search
    query = params[:query]
    @market_coins = MarketCoin.search(query).order(market_cap: :desc).order(sort_order: :asc).limit(4)
    throw_success market_coins: market_coins
  end

  def show
    @coin_tracking = tracking_handler.solve
    throw_success coin_tracking: coin_tracking, market_coin: market_coin
  end

  def destroy
    tracking_handler.reset
    throw_success
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
