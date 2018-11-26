module Queries
  class ShowWatchlistCoin < Queries::BaseQuery
    type Types::WatchlistCoin, null: true
    description "Get the watchlist coin"

    argument :id, ID, required: true

    def resolve(id:)
      return unless current_user
      current_user.watchlist_coins.find_by(id: id)
    end
  end
end
