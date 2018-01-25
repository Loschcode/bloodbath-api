class CreateUserSetting < ActiveRecord::Migration[5.1]
  def change
    create_table :user_settings do |t|
      t.belongs_to :user, foreign_key: { on_delete: :cascade }
      # mainly for footer purpose
      t.references :primary_market_coin, references: :market_coins #, foreign_key: { on_delete: :nullify }
    end
  end
end
