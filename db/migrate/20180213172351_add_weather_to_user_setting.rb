class AddWeatherToUserSetting < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      change_table :user_settings do |t|
        dir.up   {
          t.boolean :weather, default: false
        }
        dir.down {
          remove_column :user_settings, :weather
        }
      end
    end
  end
end
