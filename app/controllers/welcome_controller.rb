class WelcomeController < ApplicationController

  before_action :authenticated?
  
  def index
    throw_success
  end
end
