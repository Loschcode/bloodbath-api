class UserController < BaseController
  before_action :authenticated?

  def show
    render json: user
  end

  private

  def user
    current_user
  end
end
