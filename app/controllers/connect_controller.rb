require 'digest'

class ConnectController < ApplicationController

  before_action :authenticated?, only: [:register]

  # creation and sign-in
  # of anonymous users
  def anonymous
    return throw_error 'You are already signed-in' if current_user
    throw_success token: user_maker.anonymous.token
  end

  # we actually just covert the current anonymous user
  # to a customer
  def register
    return throw_error 'You are already signed-in' unless current_user.role == 'anonymous'
    user_maker.convert_to_customer(user: current_user, email: params[:email], password: params[:password])
    throw_success user: current_user
  end

  def authenticate
    user = user_maker.authenticate(email: params[:email], password: params[:password])
    if user
      throw_success user: user
    else
      throw_error error: "Authentication impossible"
    end
  end

  private

  def user_maker
    @user_maker ||= UserMaker.new
  end
end
