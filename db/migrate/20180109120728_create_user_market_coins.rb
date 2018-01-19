class CreateUserMarketCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :user_market_coins do |t|

      # coin preferences
      t.datetime :favorited_at

      t.belongs_to :user
      t.belongs_to :market_coin

      t.timestamps
    end
  end
end
