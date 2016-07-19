class AddUserInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :string
    add_column :users, :role, :string, default: "Reader"
    add_index :users, :username
  end
end
