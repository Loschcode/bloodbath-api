class ApplicationController < ActionController::API

  # call was solved as a success
  def throw_success(data = {})
    render json: { success: true, data: data }
  end

  # call was solved as a failure
  def throw_error(message)
    render json: { success: false, error: message }
  end
  
end
