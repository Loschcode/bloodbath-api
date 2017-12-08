class CurrenciesController < ApplicationController
  attr_reader :currency

  before_action :set_currency

  def index
  end

  def show
    base_value = crypto_memory.solve
    current_value = crypto_api.current_value
    binding.pry
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
