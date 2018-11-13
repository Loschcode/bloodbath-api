module Types
  class QueryType < Types::BaseObject
    extend ActiveSupport::Concern

    field :user, Types::User, null: true do
      argument :id, ID, required: true
    end

    def user
      return unless current_user
      ::User.find_by(id: id)
    end

    field :users, [Types::User], null: true do
    end

    def users
      return [] unless current_user
      ::User.all
    end

    field :currentUser, Types::User, null: true do
    end

    def current_user
      super
    end

    field :userSetting, Types::UserSetting, null: true do
    end

    def user_setting
      return unless current_user
      current_user.user_setting
    end

    field :marketCoin, Types::MarketCoin, null: true do
      argument :id, ID, required: true
    end

    def market_coin(id:)
      return unless current_user
      ::MarketCoin.find_by(id: id)
    end

    field :marketCoins, [Types::MarketCoin], null: true do
      argument :filter, Types::JsonType, required: false
    end

    def market_coins(filter:{})
      return unless current_user
      ::MarketCoin.all
    end

    field :watchlist, Types::UserWatchlist, null: true do
    end

    def watchlist
      return unless current_user
      current_user.user_watchlist
    end

    field :portfolioCoin, Types::PortfolioCoin, null: true do
      argument :id, ID, required: true
    end

    def portfolio_coin(id:)
      return unless current_user
      current_user.portfolio_coins.find_by(id: id)
    end

    field :portfolioCoins, [Types::PortfolioCoin], null: false do
      description "Find portfolio coins"
    end

    def portfolio_coins
      return [] unless current_user
      current_user.portfolio_coins
    end

    field :watchlistCoin, Types::WatchlistCoin, null: true do
      argument :id, ID, required: true
    end

    def watchlist_coin(id:)
      return unless current_user
      current_user.watchlist_coins.find_by(id: id)
    end

    field :watchlistCoins, [Types::WatchlistCoin], null: false do
      description "Find watchlist coins"
    end

    def watchlist_coins
      return [] unless current_user
      current_user.watchlist_coins
    end
  end
end
