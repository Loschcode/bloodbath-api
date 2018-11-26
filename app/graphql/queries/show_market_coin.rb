module Queries
  class ShowMarketCoin < Queries::BaseQuery
    type Types::MarketCoin, null: true
    description "Get the user setting"

    argument :id, ID, required: true

    def resolve(id:)
      return unless current_user
      ::MarketCoin.find_by(id: id)
    end
  end
end
