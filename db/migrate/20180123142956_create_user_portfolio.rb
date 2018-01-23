class CreateUserPortfolio < ActiveRecord::Migration[5.1]
  def change
    create_table :user_portfolios do |t|
      t.belongs_to :user, foreign_key: { on_delete: :cascade }
    end
  end
end
