class CurrenciesController < ApplicationController
  attr_reader :currency, :base_value, :current_value

  before_action :authenticate_user!
  before_action :set_currency

  def index
  end

  def show
    @currency_tracking = tracking_handler.solve

    base_value = @currency_tracking.base_price
    current_value = @currency_tracking.currency_state.price

    difference = (100 - (base_value / current_value) * 100).round(2)
    render json: {
      name: currency.upcase,
      base_value: base_value,
      current_value: current_value,
      difference: difference }
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
