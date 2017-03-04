class AddVideosTables < ActiveRecord::Migration
  def change
    create_table :video_categories do |t|
      t.string  :name, null: false, default: ""
      t.integer :category_type, null: false
      t.string  :playlist_uri

      t.timestamps
    end

    create_table :videos do |t|
      t.string  :name, null: false, default: ""
      t.string  :link
      t.integer :image_id
      t.integer :video_category_id, null: false

      t.timestamps
    end

    add_index       :videos, :image_id
    add_index       :videos, :video_category_id
    add_foreign_key :videos, :images
    add_foreign_key :videos, :video_categories
  end
end
