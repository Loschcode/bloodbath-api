class CreateUserSetting < ActiveRecord::Migration[5.1]
  def change
    create_table :user_settings do |t|
      t.belongs_to :user, foreign_key: { on_delete: :cascade }

      t.belongs_to :base_currency
      t.references :primary_market_coin, references: :market_coins

      t.timestamps
    end
  end
end
