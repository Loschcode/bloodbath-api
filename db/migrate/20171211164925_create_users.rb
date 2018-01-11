class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table(:users) do |t|

      # recognition
      t.string :token

      # account type
      t.string :role

      # authentication
      t.string :email
      t.string :encrypted_password, :null => false, :default => ""

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :token, unique: true
  end
end
