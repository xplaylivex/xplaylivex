class AddTypeToUser < ActiveRecord::Migration
  def up
    add_column :users, :role, :integer, :default => 2
  end

  def down
    remove_column :users, :role
  end
end
