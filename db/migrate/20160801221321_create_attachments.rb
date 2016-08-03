class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.attachment :asset, null: false
      t.references :entry, foreign_key: true, null: false, index: true

      t.timestamps null: false
    end
  end
end