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

ActiveRecord::Schema.define(version: 20180524221310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "message_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["message_id"], name: "index_comments_on_message_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "from_id"
    t.bigint "to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.index ["from_id"], name: "index_invitations_on_from_id"
    t.index ["team_id"], name: "index_invitations_on_team_id"
    t.index ["to_id"], name: "index_invitations_on_to_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.index ["author_id"], name: "index_messages_on_author_id"
    t.index ["team_id"], name: "index_messages_on_team_id"
  end

  create_table "team_invite_requests", force: :cascade do |t|
    t.bigint "from_id"
    t.bigint "to_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id"], name: "index_team_invite_requests_on_from_id"
    t.index ["team_id"], name: "index_team_invite_requests_on_team_id"
    t.index ["to_id"], name: "index_team_invite_requests_on_to_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_members"
    t.bigint "user_id"
    t.string "schedule"
    t.index ["activity_id"], name: "index_teams_on_activity_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "teams_users", id: false, force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "user_id", null: false
    t.index ["team_id"], name: "index_teams_users_on_team_id"
    t.index ["user_id"], name: "index_teams_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "messages"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "invitations", "teams"
  add_foreign_key "invitations", "users", column: "from_id"
  add_foreign_key "invitations", "users", column: "to_id"
  add_foreign_key "messages", "teams"
  add_foreign_key "messages", "users", column: "author_id"
  add_foreign_key "team_invite_requests", "teams"
  add_foreign_key "team_invite_requests", "users", column: "from_id"
  add_foreign_key "team_invite_requests", "users", column: "to_id"
  add_foreign_key "teams", "activities"
  add_foreign_key "teams", "users"
end
