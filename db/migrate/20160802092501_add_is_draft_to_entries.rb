class AddIsDraftToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :is_draft, :boolean, null: false, default: true
  end
end
