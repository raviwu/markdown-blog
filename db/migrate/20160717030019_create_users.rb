class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, index: true, null: false, uniqness: true
      t.string :username, index: true, null:false, uniqness: true
      t.string :password_digest
    end
  end
end
