module Queries
  class ShowUserWatchlist < Queries::BaseQuery
    type Types::UserWatchlist, null: true
    description "Get the user watchlist"

    def resolve
      return unless current_user
      current_user.user_watchlist
    end
  end
end
