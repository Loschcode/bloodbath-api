# simple metrics to see clear without admin dashboard
class MetricsController < ApplicationController

  before_action :set_coin_id, only: [:show]

  def index
    render json: {
      users: {
        anonymous: anonymous_count,
        customers: customers_count
      },
      portfolios: portfolios
    }
  end

  private

  def anonymous_count
    User.where(role: :anonymous).count
  end

  def customers_count
    User.where(role: :customer).count
  end

  def portfolios
    UserPortfolio.count
  end

end
