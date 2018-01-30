class BaseCurrenciesController < ApplicationController
  attr_reader :base_currencies, :base_currency

  before_action :authenticated?

  before_action :set_base_currency, only: [:show]

  def index
    @base_currencies = BaseCurrency.all
    throw_success base_currencies: base_currencies
  end

  def show
    throw_success base_currency: base_currency
  end

  private

  def set_base_currency
    @base_currency = BaseCurrency.find(params[:id])
  end

end
