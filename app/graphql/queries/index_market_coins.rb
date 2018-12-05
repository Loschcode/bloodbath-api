module Queries
  class IndexMarketCoins < Queries::BaseQuery
    type [Types::MarketCoin], null: true
    description "Get the market coins"

    argument :filter, Types::JsonType, required: false
    argument :limit, Integer, required: false

    def resolve(filter: {}, limit: 20)
      return unless current_user

      market_coins = ::MarketCoin
      market_coins.search filter[:search] unless filter[:search].blank?
      market_coins.default_order.limit(limit)
    end
  end
end
