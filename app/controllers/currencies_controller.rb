class CurrenciesController < ApplicationController
  attr_reader :currency, :base_value, :current_value

  before_action :set_currency

  def index
  end

  def show
    @base_value = crypto_memory.solve
    @current_value = crypto_api.current_value
    @difference = 100 - (base_value / current_value) * 100
  end

  def destroy
    crypto_memory.reset
    redirect_back fallback_location: currencies_path(currency)
  end

  private

  def set_currency
    @currency = params[:id].upcase
  end

  def crypto_api
    @crypto_api ||= CryptoApi.new(currency: currency)
  end

  def crypto_memory
    @crypto_memory ||= CryptoMemory.new(request: request, currency: currency)
  end

end
