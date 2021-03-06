module Types
  class WatchlistCoin < Types::BaseObject
    description "A watchlist coin"

    field :id, ID, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user_watchlist, Types::UserWatchlist, null: false
    field :market_coin, Types::MarketCoin, null: false
  end
end
