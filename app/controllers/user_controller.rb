class UserController < ApplicationController
  before_action :authenticated?

  def show
    # TODO : turn into a serializer’
    render json: user.as_json(include: {:user_setting => {include: [:primary_market_coin, :base_currency]}})
  end

  private

  def user
    current_user
  end

end
