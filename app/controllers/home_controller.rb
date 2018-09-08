class HomeController < BaseController

  before_action :authenticated?

  def index
    render json: {}
  end
end
