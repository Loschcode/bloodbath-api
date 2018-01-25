class CreatePortfolioCoin < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_coins do |t|
      t.float :quantity

      t.belongs_to :user_portfolio, foreign_key: { on_delete: :cascade }
      t.belongs_to :market_coin, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
