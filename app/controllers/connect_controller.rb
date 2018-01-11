class ConnectController < ApplicationController

  # creation and sign-in of anonymous users
  def anonymous
    return throw_error 'You are already signed-in' if current_user
    throw_success email: anonymous_user.email, password: anonymous_user.password
  end

  private

  # very small method to generate a new anonymous user
  # if it evolves, please make a library
  def anonymous_user
    @anonymous_user ||= begin
      email = "#{SecureRandom.uuid}@cryptoscreen.com"
      password = "#{SecureRandom.uuid}"
      User.create(email: email, password: password)
    end
  end

end
