class CreateCompositions < ActiveRecord::Migration
  def change
    create_table :compositions do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :title
      t.string :description
      t.text :content
      t.boolean :published, default: :false
      t.timestamps
    end

    add_index :compositions, :user_id
    add_index :compositions, :project_id
  end
end
