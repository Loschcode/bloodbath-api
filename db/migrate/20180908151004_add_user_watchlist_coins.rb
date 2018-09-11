class AddUserWatchlistCoins < ActiveRecord::Migration[5.1]
  def change
    # make new stuff
    create_table :user_watchlists do |t|
      t.belongs_to :user
      t.timestamps
    end

    create_table :watchlist_coins do |t|
      t.belongs_to :user_watchlist
      t.belongs_to :market_coin
      t.timestamps
    end

    # move things around
    UserMarketCoin.where.not(favorited_at: nil).each do |user_market_coin|
      user = user_market_coin.user

      unless user
        user_market_coin.delete
        next
      end


      unless user_watchlist = user.user_watchlist
        user_watchlist = UserWatchlist.create!(
          user: user
        )
      end

      WatchlistCoin.create!(
        user_watchlist: user_watchlist,
        market_coin: user_market_coin.market_coin
      )
    end

    # remove old stuff
    remove_column :user_market_coins, :favorited_at, :datetime
  end
end
