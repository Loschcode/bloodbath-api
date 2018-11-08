module Types
  class UserWatchlist < Types::BaseObject
    description "A coin from the portfolio of a user"

    field :id, ID, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::User, null: false

    field :watchlist_weather, Float, null: false

    def watchlist_weather
      variations = []
      quantities = 0

      object.watchlist_coins.each do |watchlist_coin|
        market_coin = watchlist_coin.market_coin
        next unless market_coin

        variations << market_coin.price_variation
        quantities += 1
      end

      variations.sum / quantities
    end
  end
end
