class ConnectController < ApplicationController

  before_action :authenticated?, only: [:register]

  # creation and sign-in
  # of anonymous users
  def anonymous
    return throw_error 'You are already signed-in' if current_user
    render json: { token: user_maker.anonymous.token }
  end

  # we actually just covert the current anonymous user
  # to a customer
  def register
    return throw_error 'You are already signed-in' unless current_user.role == 'anonymous'
    user_maker.convert_to_customer(user: current_user, email: params[:email], password: params[:password])
    render json: current_user
  end

  def authenticate
    user = user_maker.authenticate(email: params[:email], password: params[:password])
    if user
      render json: user
    else
      throw_error error: "Wrong credentials"
    end
  end

  private

  def user_maker
    @user_maker ||= UserMaker.new
  end
end
