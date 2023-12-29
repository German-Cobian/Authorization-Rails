class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, index: { unique: true }
    add_column :users, :is_enabled, :boolean, default: true
    add_column :users, :role, :integer, default: 0
  end
end

class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :is_private, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end