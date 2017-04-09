# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.attachment :asset, null: false
      t.references :entry, foreign_key: true, null: false, index: true

      t.timestamps null: false
    end
  end
end
