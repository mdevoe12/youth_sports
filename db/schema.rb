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


ActiveRecord::Schema.define(version: 20170831031543) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "admin_profiles", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_admin_profiles_on_admin_id"
  end
    
  create_table "coach_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "institution"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coach_id"
    t.index ["coach_id"], name: "index_coach_profiles_on_coach_id"
  end

  create_table "player_profiles", force: :cascade do |t|
    t.string "username"
    t.string "school"
    t.string "height"
    t.string "weight"
    t.integer "grade_level"
    t.float "gpa"
    t.string "guardian_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id"
    t.index ["player_id"], name: "index_player_profiles_on_player_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  add_foreign_key "admin_profiles", "users", column: "admin_id"
  add_foreign_key "coach_profiles", "users", column: "coach_id"
  add_foreign_key "player_profiles", "users", column: "player_id"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
