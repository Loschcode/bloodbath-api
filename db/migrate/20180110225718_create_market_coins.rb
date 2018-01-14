class CreateMarketCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :market_coins do |t|

      # informations
      t.string :symbol
      t.string :name
      t.string :coin_name
      t.string :full_name

      # details
      t.string :algorithm
      t.string :proof_type

      # numbers
      t.float :market_cap
      t.float :price
      
      t.timestamps
    end

    add_index :market_coins, :symbol, unique: true
  end
end
