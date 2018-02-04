# here we get the coins with all their informations
# linked to the current user
class CoinsController < ApplicationController
  attr_reader :coin_id, :market_coin, :market_coins, :user_market_coin

  before_action :authenticated?

  before_action :set_coin_id, only: [:show]

  def index
  end

  def favorite
    @market_coins = current_user.user_market_coins.with_favorite.order(favorited_at: :asc).map(&:market_coin)
    render json: coins_hash(market_coins)
  end

  def top
    @market_coins = MarketCoin.order(sort_order: :asc).limit(8)
    top_coins = coins_hash(market_coins)
    render json: top_coins
  end

  def search
    query = params[:query]
    @market_coins = MarketCoin.search(query).order(market_cap: :desc).order(sort_order: :asc).limit(4)
    result_coins = coins_hash(market_coins)
    render json: result_coins
  end

  def show
    render json: {
      market_coin: MarketCoinSerializer.new(market_coin),
      user_market_coin: user_market_coin(market_coin),
      portfolio_coin: portfolio_coin(market_coin)
    }
  end

  private

  def coins_hash(market_coins)
    market_coins.reduce([]) do |acc, market_coin|
      acc << {
        market_coin: MarketCoinSerializer.new(market_coin),
        user_market_coin: user_market_coin(market_coin),
        portfolio_coin: portfolio_coin(market_coin)
      }
    end
  end

  def portfolio_coin(market_coin)
    current_user.user_portfolio.portfolio_coins.where(market_coin: market_coin).first
  end

  def user_market_coin(market_coin)
    UserMarketCoinHandler.new(user: current_user, market_coin: market_coin).find
  end

  def market_coin
    @market_coin ||= MarketCoinHandler.new(coin_id: coin_id).refresh_and_fetch
  end

  def set_coin_id
    @coin_id = params[:id]
  end

end
