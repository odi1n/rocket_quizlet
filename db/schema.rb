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

ActiveRecord::Schema.define(version: 2021_04_14_151630) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bases", force: :cascade do |t|
    t.string "type", comment: "Тип вопрос/ответ"
    t.string "text", comment: "Текст"
    t.bigint "category_id", comment: "Категория"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_bases_on_category_id"
  end

  create_table "bases_test_cases", id: false, force: :cascade do |t|
    t.bigint "test_case_id", null: false
    t.bigint "basis_id", null: false
    t.index ["test_case_id", "basis_id"], name: "index_bases_test_cases_on_test_case_id_and_basis_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", comment: "Название категории"
  end

  create_table "categories_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.index ["user_id", "category_id"], name: "index_categories_users_on_user_id_and_category_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.jsonb "data_data"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "user_id", comment: "Пользователи"
    t.string "text", comment: "Текст комментария"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["user_id"], name: "index_comments_on_user_id"
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

  create_table "question_answers", force: :cascade do |t|
    t.bigint "question_id", null: false, comment: "Вопрос"
    t.bigint "answer_id", null: false, comment: "Ответ"
    t.boolean "is_correct", default: false, null: false, comment: "Проверка решен ли"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_question_answers_on_answer_id"
    t.index ["question_id"], name: "index_question_answers_on_question_id"
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

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "Пользователи"
    t.bigint "category_id", null: false, comment: "Категории"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_requests_on_category_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "simple_captcha_data", id: :serial, force: :cascade do |t|
    t.string "key", limit: 40
    t.string "value", limit: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "idx_key"
  end

  create_table "test_cases", force: :cascade do |t|
    t.string "title"
    t.bigint "category_id", null: false, comment: "Категории"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_test_cases_on_category_id"
  end

  create_table "test_reports", force: :cascade do |t|
    t.bigint "test_cases_id", comment: "Связная с тестами"
    t.bigint "user_id", null: false, comment: "Пользователи"
    t.integer "state", comment: "Тип прохождения"
    t.string "invite_token", comment: "Ссылка на репорт"
    t.integer "right_count", default: 0, null: false, comment: "Кол-во правильных ответов"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["test_cases_id"], name: "index_test_reports_on_test_cases_id"
    t.index ["user_id"], name: "index_test_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false, comment: "Email"
    t.string "encrypted_password", default: "", null: false, comment: "Password"
    t.string "username", default: "", null: false, comment: "Имя пользователя"
    t.string "lastname", default: "", null: false, comment: "Фамилия пользователя"
    t.string "invite_token", default: "f", comment: "Пригласительный токен"
    t.integer "role", comment: "Роль пользвоателя"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
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

  add_foreign_key "bases", "categories"
  add_foreign_key "comments", "users"
  add_foreign_key "question_answers", "bases", column: "answer_id"
  add_foreign_key "question_answers", "bases", column: "question_id"
  add_foreign_key "requests", "categories"
  add_foreign_key "requests", "users"
  add_foreign_key "test_cases", "categories"
  add_foreign_key "test_reports", "test_cases", column: "test_cases_id"
  add_foreign_key "test_reports", "users"
end
