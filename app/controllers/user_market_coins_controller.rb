class UserMarketCoinsController < BaseController
  attr_reader :user_market_coins

  before_action :authenticated?

  before_action :set_user_market_coin

  def update
    unless user_market_coin.update user_market_coin_params
      throw_error "#{user_market_coin.errors.full_messages.join(', ')}"
      return
    end

    render json: user_market_coin
  end

  private

  def user_market_coin_params
    params[:user_market_coin].permit!
  end

  def user_market_coin
    @user_market_coin ||= UserMarketCoin.find params[:id]
  end
end
