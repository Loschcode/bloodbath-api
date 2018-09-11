class UserPortfolioController < BaseController
  attr_reader :user_portfolio

  before_action :authenticated?

  before_action :set_user_portfolio

  def show
    render json: user_portfolio.as_json(include: :portfolio_coins)
  end

  private

  def set_user_portfolio
    @user_portfolio = UserPortfolioHandler.new(user: current_user).find
  end
end
