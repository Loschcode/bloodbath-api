# simple metrics to see clear without admin dashboard
class MetricsController < BaseController

  before_action :set_coin_id, only: [:show]

  # this was made very fast to have some metrics linked to the users
  # in the ideal we should actually use a third party service
  def index
    render json: {
      users: {
        anonymous: anonymous_count,
        customers: {
          count: customers.count,
          emails: customers.pluck(:email),
          last_seen_at: customers.pluck(:last_seen_at),
          updated_at: customers.pluck(:updated_at)
        }
      },
      portfolios: portfolios
    }
  end

  private

  def anonymous_count
    User.where(role: :anonymous).count
  end

  def customers
    @customers ||= User.where(role: :customer)
  end

  def portfolios
    UserPortfolio.count
  end

end
