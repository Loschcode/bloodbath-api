class MarketCoinFromSortOrderToRank < ActiveRecord::Migration[5.1]
  def change
    rename_column :market_coins, :sort_order, :rank
    change_column :market_coins, :rank, :integer
    set_to_null
  end

  def set_to_null
    MarketCoin.all.each do |market_coin|
      market_coin.rank = nil
      market_coin.save(validate: false)
      puts "MarketCoin #{market_coin.id} rank nullified."
    end
  end
end
