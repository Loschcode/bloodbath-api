module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
      reject_unauthorized_connection unless current_user
      refresh_last_seen_at
    end

    def refresh_last_seen_at
      current_user.update_columns last_seen_at: Time.now
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
