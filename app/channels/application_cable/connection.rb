module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
      # self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      # User.find_by_authentication_token(params[:token])
      # find_for_database_authentication
      # TODO : this shit isn't protected at all, i failed to bypass devise password system because they are pieces of shit.
      # if current_user = User.find_by_email(request.params[:email])
      #   current_user
      # else
      #   reject_unauthorized_connection
      # end
    end

  end
end
