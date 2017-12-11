class CurrenciesController < ApplicationController
  attr_reader :currency, :base_value, :current_value

  before_action :set_currency

  def index
  end

  def show
    render json: {success: true, bullshit: true}
    return

    @currency_trace = crypto_memory.solve
    @base_value = @currency_trace.base_value
    @current_value = @currency_trace.current_value
    @difference = 100 - (base_value / current_value) * 100
    render json: { base_value: @base_value, current_value: @current_value, difference: @difference }
  end

  def destroy
    crypto_memory.reset
    render json: { success: true }
  end

  private

  def set_currency
    @currency = params[:id].upcase
  end

  def crypto_memory
    @crypto_memory ||= CryptoMemory.new(user: current_user, currency: currency)
  end

end
