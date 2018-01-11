class CreateCoinTrackings < ActiveRecord::Migration[5.1]
  def change
    create_table :coin_trackings do |t|
      t.float :base_price

      t.belongs_to :user
      t.belongs_to :market_coin

      t.timestamps
    end
  end
end
