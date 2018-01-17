class CoinsController < ApplicationController
  attr_reader :currency, :market_coin, :market_coins, :user_market_coin

  before_action :authenticated?

  before_action :set_currency, except: [:index, :top, :search]

  def index
  end

  def favorite
    @favorite_coins = current_user.user_market_coins.with_favorite.map(&:market_coin)
    throw_success favorite_coins: top_coins
  end

  def top
    @market_coins = MarketCoin.order(market_cap: :desc).order(sort_order: :asc).limit(8)
    top_coins = market_coins.reduce([]) do |acc, market_coin|
      acc << {market_coin: market_coin, user_market_coin: TrackingHandler.new(user: current_user, market_coin: market_coin).solve}
    end
    throw_success top_coins: top_coins
  end

  def search
    query = params[:query]
    @market_coins = MarketCoin.search(query).order(market_cap: :desc).order(sort_order: :asc).limit(4)
    result_coins = market_coins.reduce([]) do |acc, market_coin|
      acc << {market_coin: market_coin, user_market_coin: TrackingHandler.new(user: current_user, market_coin: market_coin).solve}
    end
    throw_success result_coins: result_coins
  end

  def show
    @user_market_coin = TrackingHandler.new(user: current_user, market_coin: market_coin).solve
    throw_success user_market_coin: user_market_coin, market_coin: market_coin
  end

  private

  def set_currency
    @currency = params[:id].upcase
  end

  def market_coin
    @market_coin ||= MarketHandler.new(currency: currency).refresh_and_fetch
  end

end
