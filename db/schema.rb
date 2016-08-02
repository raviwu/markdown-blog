# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160801225929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "asset_file_name",    null: false
    t.string   "asset_content_type", null: false
    t.integer  "asset_file_size",    null: false
    t.datetime "asset_updated_at",   null: false
    t.integer  "entry_id",           null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["entry_id"], name: "index_attachments_on_entry_id", using: :btree
  end

  create_table "entries", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.string   "slug"
    t.json     "payload"
    t.integer  "user_id",      null: false
    t.string   "author_name"
    t.datetime "published_at", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["slug"], name: "index_entries_on_slug", using: :btree
    t.index ["type"], name: "index_entries_on_type", using: :btree
    t.index ["user_id"], name: "index_entries_on_user_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.string   "asset_file_name",    null: false
    t.string   "asset_content_type", null: false
    t.integer  "asset_file_size",    null: false
    t.datetime "asset_updated_at",   null: false
    t.integer  "entry_id",           null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["entry_id"], name: "index_images_on_entry_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string "email",           null: false
    t.string "username",        null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

  add_foreign_key "attachments", "entries"
  add_foreign_key "entries", "users"
  add_foreign_key "images", "entries"
end
