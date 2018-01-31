class PortfolioCoinsController < ApplicationController
  attr_reader :portfolio_coin

  before_action :authenticated?

  before_action :set_portfolio_coin, only: [:update, :destroy]

  def index
    render json: portfolio_coins, each_serializer: PortfolioCoinSerializer
  end

  def create
    # TODO : should be a validation
    if already_present?(portfolio_coin_params[:market_coin_id])
      throw_error "Market coin already inserted"
      return
    end
    # END OF VALIDATION
    unless portfolio_coin = create_portfolio_coin
      throw_error "#{user_market_coin.errors.full_messages.join(', ')}"
      return
    end
    render json: portfolio_coin
  end

  def update
    unless portfolio_coin.update(portfolio_coin_params)
      throw_error "#{user_portfolio.errors.full_messages.join(', ')}"
      return
    end
    render json: portfolio_coin
  end

  def destroy
    unless portfolio_coin.destroy
      throw_error "#{user_portfolio.errors.full_messages.join(', ')}"
      return
    end
    render json: {}
  end

  private

  def create_portfolio_coin
    PortfolioCoin.create(portfolio_coin_params.merge(user_portfolio: user_portfolio))
  end

  def already_present?(market_coin)
    user_portfolio.portfolio_coins.where(market_coin: market_coin).count > 0
  end

  def portfolio_coins
    @portfolio_coins ||= user_portfolio.portfolio_coins.order(created_at: :asc)
  end

  def set_portfolio_coin
    @portfolio_coin ||= user_portfolio.portfolio_coins.where(id: params[:id]).first
  end

  def user_portfolio
    user_portfolio_handler.find
  end

  def portfolio_coin_params
    params[:portfolio_coin].permit!
  end

  def user_portfolio_handler
    @user_portfolio_handler ||= UserPortfolioHandler.new(user: current_user)
  end

end
