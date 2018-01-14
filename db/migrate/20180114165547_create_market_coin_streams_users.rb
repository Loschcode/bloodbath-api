class CreateMarketCoinStreamsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :market_coin_streams_users, id: false do |t|
      t.belongs_to :market_coin_stream, index: true
      t.belongs_to :user, index: true
    end
  end
end
