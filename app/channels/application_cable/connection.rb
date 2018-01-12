module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
      reject_unauthorized_connection unless current_user
    end

    def current_user
      @current_user ||= begin
        if request.params[:token]
          User.find_by_token(request.params[:token])
        end
      end
    end
  end
end
