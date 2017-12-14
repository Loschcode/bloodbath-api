class ConnectController < ApplicationController

  # NOTE : most of the authentication system is managed by devise token auth
  # we created this controller for special cases such as anonymous user log-in

  def anonymous
    return throw_error 'You are already signed-in' if current_user
    throw_success email: anonymous_user.email, password: anonymous_user.password
  end

  private

  # call was solved as a success
  def throw_success(data = {})
    render json: { success: true, data: data}
  end

  # call was solved as a failure
  def throw_error(message)
    render json: { success: false, error: message }
  end

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
