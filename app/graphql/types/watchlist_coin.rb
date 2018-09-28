module Types
  class WatchlistCoin < GraphQL::Schema::Object
    description "A watchlist coin"

    field :id, ID, null: false
    field :market_coin, Types::MarketCoin, null: false
  end
end
