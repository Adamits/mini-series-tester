class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.string :type
      t.string :name
      t.integer :votable_id
      t.string :votable_type
      t.timestamps
    end

    add_index :votes, :user_id
  end
end
