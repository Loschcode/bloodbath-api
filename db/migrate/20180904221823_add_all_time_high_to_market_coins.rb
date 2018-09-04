class AddAllTimeHighToMarketCoins < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      change_table :market_coins do |t|
        dir.up   {
          t.float :all_time_high, default: nil
        }
        dir.down {
          remove_column :market_coins, :all_time_high
        }
      end
    end
  end
end
