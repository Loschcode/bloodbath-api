class AddLastSeenAtToUsers < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.up   {
          t.datetime :last_seen_at, default: nil
        }
        dir.down {
          remove_column :users, :last_seen_at
        }
      end
    end
  end
end
