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

ActiveRecord::Schema[7.0].define(version: 2024_07_08_234427) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "contact_number", null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_contacts_on_uuid", unique: true
  end

  create_table "form_fields", force: :cascade do |t|
    t.string "uuid", null: false
    t.integer "field_type", null: false
    t.text "custom_css", null: false
    t.text "label", null: false
    t.string "font_type", null: false
    t.integer "font_size", null: false
    t.string "font_family", null: false
    t.string "fill_color", null: false
    t.integer "fill_color_percent", null: false
    t.integer "alignment_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "form_id"
    t.index ["form_id"], name: "index_form_fields_on_form_id"
    t.index ["uuid"], name: "index_form_fields_on_uuid", unique: true
  end

  create_table "form_templates", force: :cascade do |t|
    t.integer "form_type"
    t.string "title"
    t.text "custom_css"
    t.jsonb "html_script"
    t.integer "state"
    t.boolean "prebuilt", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forms", force: :cascade do |t|
    t.string "uuid", null: false
    t.integer "form_type", null: false
    t.string "title", null: false
    t.text "html_script"
    t.string "state", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "email_confirmation_with_otp", default: false, null: false
    t.boolean "thank_you_message", default: false, null: false
    t.index ["user_id"], name: "index_forms_on_user_id"
    t.index ["uuid"], name: "index_forms_on_uuid", unique: true
  end

  create_table "price_pointers", force: :cascade do |t|
    t.string "subtitle"
    t.string "description"
    t.bigint "price_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["price_id"], name: "index_price_pointers_on_price_id"
  end

  create_table "prices", force: :cascade do |t|
    t.string "name"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
    t.index ["uuid"], name: "index_roles_on_uuid", unique: true
  end

  create_table "roles_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "system_notifications", force: :cascade do |t|
    t.string "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "title", null: false
    t.text "content", null: false
    t.string "state", default: "unread", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_system_notifications_on_user_id"
    t.index ["uuid"], name: "index_system_notifications_on_uuid", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.jsonb "image_data"
    t.string "email"
    t.string "phone_number"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  create_table "verification_requests", force: :cascade do |t|
    t.boolean "verified"
    t.string "otp_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "form_fields", "forms"
  add_foreign_key "forms", "users"
  add_foreign_key "price_pointers", "prices"
  add_foreign_key "roles_users", "roles", on_delete: :cascade
  add_foreign_key "roles_users", "users", on_delete: :cascade
  add_foreign_key "system_notifications", "users"
end
