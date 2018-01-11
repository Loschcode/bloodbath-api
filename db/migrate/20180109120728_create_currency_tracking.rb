class CreateCurrencyTracking < ActiveRecord::Migration[5.1]
  def change
    create_table :currency_trackings do |t|
      t.float :base_price

      t.belongs_to :user
      t.belongs_to :currency_state
      
      t.timestamps
    end
  end
end
