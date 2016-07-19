class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :type
      t.string :attachable_type
      t.integer :attachable_id
      t.string :attachment
      t.string :original_filename
      t.string :content_type
      t.timestamps
    end
  end
end
