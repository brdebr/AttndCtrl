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

ActiveRecord::Schema.define(version: 20180607193514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "lti_contexts", force: :cascade do |t|
    t.integer "lti_id"
    t.string "label"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lti_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lti_users", force: :cascade do |t|
    t.string "full_name"
    t.string "given"
    t.string "family"
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timetable_units", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "week_day"
    t.time "start_time"
    t.time "finish_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "timetable_id"
    t.index ["timetable_id"], name: "index_timetable_units_on_timetable_id"
  end

  create_table "timetables", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tool_consumer_id"
    t.index ["tool_consumer_id"], name: "index_timetables_on_tool_consumer_id"
  end

  create_table "tool_consumers", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_tool_consumers_on_admin_id"
  end

  add_foreign_key "timetable_units", "timetables"
  add_foreign_key "timetables", "tool_consumers"
  add_foreign_key "tool_consumers", "admins"
end
