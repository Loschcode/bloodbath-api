class CreateCurrencyTrace < ActiveRecord::Migration[5.1]
  def change
    create_table :currency_traces do |t|
      t.string :currency
      t.float :base_value
      t.float :current_value

      t.timestamps
    end
  end
end
