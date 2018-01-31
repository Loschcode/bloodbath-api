class UserPortfolioController < ApplicationController
  attr_reader :user_portfolio

  before_action :authenticated?

  before_action :set_user_portfolio

  def show
    render json: user_portfolio.as_json(include: :portfolio_coins)
  end

  # def update
  #   unless user_portfolio.update(user_portfolio_params)
  #     throw_error "#{user_portfolio.errors.full_messages.join(', ')}"
  #     return
  #   end
  #
  #   render json: user_portfolio
  # end

  private

  # def user_portfolio_params
  #   params[:user_portfolio].permit!
  # end

  def set_user_portfolio
    @user_portfolio = UserPortfolioHandler.new(user: current_user).find
  end

end
