# frozen_string_literal: true

class AddIsDraftToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :is_draft, :boolean, null: false, default: true
  end
end
