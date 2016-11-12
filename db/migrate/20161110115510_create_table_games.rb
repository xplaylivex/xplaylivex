class CreateTableGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :comment
      t.string :link
      t.integer :image_id, 'integer unsigned'

      t.timestamps
    end

    add_index :games, :image_id
  end
end
