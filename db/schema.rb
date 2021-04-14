# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_14_151621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.jsonb "data_data"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "contact_messages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_contact_messages_on_created_at"
    t.index ["updated_at"], name: "index_contact_messages_on_updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "menus", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_menus_on_slug", unique: true
  end

  create_table "menus_pages", id: false, force: :cascade do |t|
    t.integer "menu_id", null: false
    t.integer "page_id", null: false
  end

  create_table "news", id: :serial, force: :cascade do |t|
    t.boolean "enabled", default: true, null: false
    t.datetime "time", null: false
    t.string "name", null: false
    t.text "excerpt"
    t.text "content"
    t.string "slug", null: false
    t.jsonb "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enabled", "time"], name: "index_news_on_enabled_and_time"
    t.index ["slug"], name: "index_news_on_slug", unique: true
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.boolean "enabled", default: true, null: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.string "name", null: false
    t.text "content"
    t.string "slug", null: false
    t.string "regexp"
    t.string "redirect"
    t.string "fullpath", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enabled", "lft"], name: "index_pages_on_enabled_and_lft"
    t.index ["slug"], name: "index_pages_on_slug", unique: true
  end

  create_table "rails_admin_settings", id: :serial, force: :cascade do |t|
    t.boolean "enabled", default: true
    t.string "kind", default: "string", null: false
    t.string "ns", default: "main"
    t.string "key", null: false
    t.float "latitude"
    t.float "longitude"
    t.text "raw"
    t.string "label"
    t.text "file_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_rails_admin_settings_on_key"
    t.index ["ns", "key"], name: "index_rails_admin_settings_on_ns_and_key", unique: true
  end

  create_table "seos", id: :serial, force: :cascade do |t|
    t.boolean "enabled", default: true, null: false
    t.integer "seoable_id"
    t.string "seoable_type"
    t.string "h1"
    t.string "title"
    t.text "keywords"
    t.text "description"
    t.string "og_title"
    t.string "robots"
    t.jsonb "og_image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seoable_id", "seoable_type"], name: "index_seos_on_seoable_id_and_seoable_type", unique: true
  end

  create_table "simple_captcha_data", id: :serial, force: :cascade do |t|
    t.string "key", limit: 40
    t.string "value", limit: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "idx_key"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "menus_pages", "menus", on_delete: :cascade
  add_foreign_key "menus_pages", "pages", on_delete: :cascade
end
