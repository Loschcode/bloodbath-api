module Queries
  class ShowUserPortfolio < Queries::BaseQuery
    type Types::UserPortfolio, null: true
    description "Get the user portfolio"

    def resolve
      return unless current_user
      current_user.user_portfolio
    end
  end
end
