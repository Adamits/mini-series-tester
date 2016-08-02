class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :type
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :name
    end

    add_index :roles, [:user_id, :start_date, :end_date]
    add_index :roles, [:start_date, :end_date]
  end
end
