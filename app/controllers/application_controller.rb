class ApplicationController < ActionController::API

  # around_action :exception_handler

  # handle exception (which will throw a page error)
  # if Rails.env.development?
  #   def exception_handler
  #     yield
  #   end
  # else
    # def exception_handler
    #   yield
    # rescue Exception => exception
    #   throw_error "#{exception}"
    # ensure
    #   # dispatch_error_email(exception)
    # end
  # end

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
