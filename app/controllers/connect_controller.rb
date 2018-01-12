require 'digest'

class ConnectController < ApplicationController
  # NOTE : this section is available for anyone

  # creation and sign-in
  # of anonymous users
  def anonymous
    return throw_error 'You are already signed-in' if current_user
    throw_success token: user_maker.anonymous.token
  end

  private

  def user_maker
    @user_maker ||= UserMaker.new
  end
end
