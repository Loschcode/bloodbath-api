class CoinsController < ApplicationController
  attr_reader :currency, :market_coin, :market_coins, :coin_tracking

  before_action :authenticated?

  before_action :set_currency, except: [:index, :top, :search]

  def index
  end

  # def favorite
  #   @favorite_coins = current_user.coin_trackings.with_favorite.map(&:market_coin)
  #   throw_success favorite_coins: top_coins
  # end

  def top
    @market_coins = MarketCoin.order(market_cap: :desc).order(sort_order: :asc).limit(8)
    top_coins = market_coins.reduce([]) do |acc, market_coin|
      acc << {market_coin: market_coin, coin_tracking: TrackingHandler.new(user: current_user, market_coin: market_coin).solve}
    end
    throw_success top_coins: top_coins
  end

  def search
    query = params[:query]
    @market_coins = MarketCoin.search(query).order(market_cap: :desc).order(sort_order: :asc).limit(4)
    result_coins = market_coins.reduce([]) do |acc, market_coin|
      acc << {market_coin: market_coin, coin_tracking: TrackingHandler.new(user: current_user, market_coin: market_coin).solve}
    end
    throw_success result_coins: result_coins
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
