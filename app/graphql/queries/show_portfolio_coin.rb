module Queries
  class ShowPortfolioCoin < Queries::BaseQuery
    type Types::PortfolioCoin, null: true
    description "Get the portfolio coin"

    argument :id, ID, required: true

    def resolve(id:)
      return unless current_user
      current_user.portfolio_coins.find_by(id: id)
    end
  end
end
