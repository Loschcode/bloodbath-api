module Queries
  class IndexWatchlistCoins < Queries::BaseQuery
    type [Types::WatchlistCoins], null: true
    description "Get the portfolio coins"

    def resolve
      return [] unless current_user
      current_user.watchlist_coins
    end
  end
end
