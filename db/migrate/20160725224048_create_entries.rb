class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :type, index: true
      t.string :title
      t.string :slug, index: true, unique: true
      t.json :payload
      t.references :user, index: true, foreign_key: true, null: false
      t.string :author_name

      t.datetime :published_at, null: false
      t.timestamps null: false
    end
  end
end
