module Types
  class QueryType < Types::BaseObject
    extend ActiveSupport::Concern

    field :currentUser, resolver: Queries::ShowCurrentUser
    field :userSetting, resolver: Queries::ShowUserSetting
    field :watchlist, resolver: Queries::IndexUserWatchlist

    field :marketCoin, resolver: Queries::ShowMarketCoin
    field :marketCoins, resolver: Queries::IndexMarketCoins

    field :portfolioCoin, resolver: Queries::ShowPortfolioCoin
    field :portfolioCoins, resolver: Queries::IndexPortfolioCoins

    field :watchlistCoin, resolver: Queries::ShowWatchlistCoin
    field :watchlistCoins, resolver: Queries::IndexWatchlistCoins
  end
end
