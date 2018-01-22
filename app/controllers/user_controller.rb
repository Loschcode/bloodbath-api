class UserController < ApplicationController
  before_action :authenticated?

  def show
    throw_success user: user.as_json(include: :user_setting)
  end

  private

  def user
    current_user
  end

end
