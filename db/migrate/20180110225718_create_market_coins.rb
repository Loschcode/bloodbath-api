class CreateMarketCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :market_coins do |t|

      # informations
      t.string :symbol
      t.string :name
      t.string :coin_name
      t.string :full_name

      # image
      t.string :logo_url

      # details
      t.string :algorithm
      t.string :proof_type

      # numbers
      t.float :market_cap
      t.float :price
      t.float :day_open
      t.float :day_high
      t.float :day_low

      t.timestamps
    end

    add_index :market_coins, :symbol, unique: true
  end
end
