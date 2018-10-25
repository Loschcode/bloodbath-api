module Types
  class WatchlistCoin < Types::BaseObject
    description "A watchlist coin"

    field :id, ID, null: false
    field :market_coin, Types::MarketCoin, null: false
  end
end
