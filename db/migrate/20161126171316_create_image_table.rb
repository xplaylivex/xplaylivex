class CreateImageTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :filename
      t.string :hash_id
      t.string :extension

      t.timestamps
    end

    add_foreign_key :users, :images
    add_foreign_key :games, :images
  end
end
