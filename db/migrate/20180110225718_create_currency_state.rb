class CreateCurrencyState < ActiveRecord::Migration[5.1]
  def change
    create_table :currency_states do |t|

      # informations
      t.string :symbol
      t.string :name
      t.string :coin_name
      t.string :full_name

      # details
      t.string :algorithm, presence: true
      t.string :proof_type, presence: true

      # numbers
      t.float :market_cap, presence: true
      t.float :price, presence: true

      t.timestamps
    end
  end
end
