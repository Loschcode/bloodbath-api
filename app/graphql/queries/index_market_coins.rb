module Queries
  class IndexMarketCoins < Queries::BaseQuery
    type [Types::MarketCoin], null: true
    description "Get the market coins"

    argument :filter, Types::JsonType, required: false

    def resolve(filter:{})
      return unless current_user
      ::MarketCoin.all
    end
  end
end
