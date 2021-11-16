class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :content
      t.integer :cost
      t.string :address
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :rooms, [:user_id, :created_at]
  end
end
