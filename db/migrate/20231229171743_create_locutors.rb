class CreateLocutors < ActiveRecord::Migration[7.0]
  def change
    create_table :locutors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :conversation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
