class CreateBaseCurrency < ActiveRecord::Migration[5.1]
  def change
    create_table :base_currencies do |t|

      t.string :code
      t.float :exchange_rate

      t.string :symbol
      t.string :full_name

      t.timestamps
    end
  end
end
