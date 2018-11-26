module Queries
  class IndexPortfolioCoins < Queries::BaseQuery
    type [Types::PortfolioCoin], null: true
    description "Get the portfolio coins"

    def resolve
      return [] unless current_user
      current_user.portfolio_coins
    end
  end
end
