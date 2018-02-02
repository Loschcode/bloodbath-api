class ApplicationController < ActionController::API

  # NOTE : to see error details in development
  # please comment this
  around_action :exception_handler

  def exception_handler
    yield
  rescue Exception => exception
    binding.pry
    throw_error error: "#{exception}"
  end

  # call was solved as a failure
  def throw_error(error)
    render json: error, status: :bad_request
  end

  def authenticated?
    if current_user
      true
    else
      raise Exception, "You must be logged-in to access this section"
    end
  end

  def current_user
    @current_user ||= begin
      if params[:token]
        User.find_by_token(params[:token])
      end
    end
  end
end
