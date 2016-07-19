class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.boolean :collaborative, default: :false
      t.boolean :published, default: :false
      t.integer :compositions_count, default: 0
      t.timestamps
    end

    add_index :projects, :user_id
  end
end
