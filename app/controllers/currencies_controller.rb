class CurrenciesController < ApplicationController
  attr_reader :currency, :currency_state, :currency_tracking

  before_action :authenticate_user!
  before_action :set_currency

  def index
  end

  def show
    @currency_tracking = tracking_handler.solve
    @currency_state = currency_tracking.currency_state

    render json: {
      success: true,
      currency_tracking: currency_tracking,
      currency_state: currency_state,
    }
  end

  def destroy
    tracking_handler.reset
    render json: { success: true }
  end

  private

  def set_currency
    @currency = params[:id].upcase
  end

  def tracking_handler
    @tracking_handler ||= TrackingHandler.new(user: current_user, currency: currency)
  end

end
