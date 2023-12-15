class AddIsEnabledToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_enabled, :boolean, default: true
  end
end
