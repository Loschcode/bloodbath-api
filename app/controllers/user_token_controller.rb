class UserTokenController < Knock::AuthTokenController

  before_action :anonymous_fallback
  before_action :authenticate

  def create
    render json: auth_token, status: :created
  end

  private

  # this is a hook to the system
  # we ensure there will be a user if the front client
  # required an anonymous access
  def anonymous_fallback
    if params[:anonymous]
      # TODO : here we build the whole anonymous user and
      # reset the params as it was sent by him ?
      email = "#{SecureRandom.uuid}@random.com"
      password = SecureRandom.uuid
      user = User.create(email: email, password: password, role: 'anonymous')
      params[:auth] = { email: email, password: password }
    end
  end

  def authenticate
    unless entity.present? && entity.authenticate(auth_params[:password])
      raise Knock.not_found_exception_class
    end
  end

  # def auth_token
  #   if entity.respond_to? :to_token_payload
  #     AuthToken.new payload: entity.to_token_payload
  #   else
  #     AuthToken.new payload: { sub: entity.id }
  #   end
  # end

  # def entity
  #   @entity ||=
  #   if entity_class.respond_to? :from_token_request
  #     entity_class.from_token_request request
  #   else
  #     entity_class.find_by email: auth_params[:email]
  #   end
  # end
  #
  # def entity_class
  #   entity_name.constantize
  # end
  #
  # def entity_name
  #   self.class.name.scan(/\w+/).last.split('TokenController').first
  # end
  #
  # def auth_params
  #   params.require(:auth).permit :email, :password
  # end
end
