class UserController < ApplicationController
  before_action :authenticated?

  def show
    throw_success user: user.as_json(include: user_setting: {:primary_market_coin, :base_currency})
  end

  private

  def user
    current_user
  end

end
