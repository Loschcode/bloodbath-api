class BaseCurrenciesController < ApplicationController
  attr_reader :base_currencies, :base_currency

  before_action :authenticated?

  def index
    @base_currencies = BaseCurrency.all
    throw_success base_currencies: base_currencies
  end

  private

end
