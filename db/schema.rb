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

ActiveRecord::Schema.define(version: 20170905134328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_admin_profiles_on_admin_id"
  end

  create_table "coach_profiles", force: :cascade do |t|
    t.string "institution"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coach_id"
    t.index ["coach_id"], name: "index_coach_profiles_on_coach_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "author_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "receiver_id"], name: "index_conversations_on_author_id_and_receiver_id", unique: true
    t.index ["author_id"], name: "index_conversations_on_author_id"
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_teams", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_teams_on_game_id"
    t.index ["team_id"], name: "index_game_teams_on_team_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "facility_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.index ["facility_id"], name: "index_games_on_facility_id"
  end

  create_table "personal_messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_personal_messages_on_conversation_id"
    t.index ["user_id"], name: "index_personal_messages_on_user_id"
  end

  create_table "player_profiles", force: :cascade do |t|
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

  create_table "player_stats", force: :cascade do |t|
    t.integer "points"
    t.integer "fouls"
    t.bigint "player_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_profile_id"], name: "index_player_stats_on_player_profile_id"
  end

  create_table "prospects", force: :cascade do |t|
    t.bigint "recruiter_profile_id"
    t.bigint "player_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["player_profile_id"], name: "index_prospects_on_player_profile_id"
    t.index ["recruiter_profile_id"], name: "index_prospects_on_recruiter_profile_id"
  end

  create_table "recruiter_profiles", force: :cascade do |t|
    t.string "institution"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recruiter_id"
    t.index ["recruiter_id"], name: "index_recruiter_profiles_on_recruiter_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_coaches", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "coach_id"
    t.index ["coach_id"], name: "index_team_coaches_on_coach_id"
    t.index ["team_id"], name: "index_team_coaches_on_team_id"
  end

  create_table "team_players", force: :cascade do |t|
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id"
    t.index ["player_id"], name: "index_team_players_on_player_id"
    t.index ["team_id"], name: "index_team_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
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
    t.string "username"
    t.string "password_digest"
    t.string "provider"
    t.string "uid"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_foreign_key "admin_profiles", "users", column: "admin_id"
  add_foreign_key "coach_profiles", "users", column: "coach_id"
  add_foreign_key "game_teams", "games"
  add_foreign_key "game_teams", "teams"
  add_foreign_key "games", "facilities"
  add_foreign_key "personal_messages", "conversations"
  add_foreign_key "personal_messages", "users"
  add_foreign_key "player_profiles", "users", column: "player_id"
  add_foreign_key "player_stats", "player_profiles"
  add_foreign_key "prospects", "player_profiles"
  add_foreign_key "prospects", "recruiter_profiles"
  add_foreign_key "recruiter_profiles", "users", column: "recruiter_id"
  add_foreign_key "team_coaches", "teams"
  add_foreign_key "team_coaches", "users", column: "coach_id"
  add_foreign_key "team_players", "teams"
  add_foreign_key "team_players", "users", column: "player_id"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
