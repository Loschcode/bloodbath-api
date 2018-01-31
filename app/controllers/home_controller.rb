class HomeController < ApplicationController

  before_action :authenticated?

  def index
    render json: {}
  end
end
