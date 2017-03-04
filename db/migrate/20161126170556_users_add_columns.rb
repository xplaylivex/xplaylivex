class UsersAddColumns < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, limit: 128, default: "", after: :email
    add_column :users, :description, :text, after: :username
    add_column :users, :birthday, :date, null: true, after: :description
    add_column :users, :favorite_game, :string, null: true, limit: 255, after: :birthday
    add_column :users, :favorite_type, :string, null: true, limit: 255, after: :favorite_game
    add_column :users, :image_id, :integer, null: true, after: :favorite_type

    add_index :users, :username, unique: true
  end
end
