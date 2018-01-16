class CreateMarketCoinStreams < ActiveRecord::Migration[5.1]
  def change
    create_table :market_coin_streams do |t|

      t.datetime :last_broadcast_at
      t.belongs_to :market_coin
    end
  end
end
