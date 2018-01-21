class CreateUserSetting < ActiveRecord::Migration[5.1]
  def change
    create_table :user_settings do |t|
      t.belongs_to :user, foreign_key: { on_delete: :cascade }
      # mainly for footer purpose
      t.references :default_market_coin, references: :market_coins # , foreign_key: { on_delete: :cascade }
    end
  end
end
