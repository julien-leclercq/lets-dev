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

ActiveRecord::Schema.define(version: 20170529121529) do

  create_table "challenges", id: nil, force: :cascade do |t|
    t.string   "title"
    t.text     "subject"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.         "language_set_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["id"], name: "sqlite_autoindex_challenges_1", unique: true
    t.index ["language_set_id"], name: "index_challenges_on_language_set_id"
  end

  create_table "contacts", id: nil, force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["id"], name: "sqlite_autoindex_contacts_1", unique: true
  end

  create_table "desk_user_memberships", id: nil, force: :cascade do |t|
    t.         "desk_id"
    t.         "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["desk_id"], name: "index_desk_user_memberships_on_desk_id"
    t.index ["id"], name: "sqlite_autoindex_desk_user_memberships_1", unique: true
    t.index ["user_id"], name: "index_desk_user_memberships_on_user_id"
  end

  create_table "desks", id: nil, force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "current"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "sqlite_autoindex_desks_1", unique: true
  end

  create_table "financial_movements", id: nil, force: :cascade do |t|
    t.float    "amount"
    t.text     "description"
    t.         "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["id"], name: "sqlite_autoindex_financial_movements_1", unique: true
    t.index ["user_id"], name: "index_financial_movements_on_user_id"
  end

  create_table "jury_challenge_memberships", id: nil, force: :cascade do |t|
    t.         "user_id"
    t.         "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["challenge_id"], name: "index_jury_challenge_memberships_on_challenge_id"
    t.index ["id"], name: "sqlite_autoindex_jury_challenge_memberships_1", unique: true
    t.index ["user_id"], name: "index_jury_challenge_memberships_on_user_id"
  end

  create_table "language_set_memberships", id: nil, force: :cascade do |t|
    t.         "language_id"
    t.         "language_set_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["id"], name: "sqlite_autoindex_language_set_memberships_1", unique: true
    t.index ["language_id"], name: "index_language_set_memberships_on_language_id"
    t.index ["language_set_id"], name: "index_language_set_memberships_on_language_set_id"
  end

  create_table "language_sets", id: nil, force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "sqlite_autoindex_language_sets_1", unique: true
  end

  create_table "languages", id: nil, force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "documentation_url"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["id"], name: "sqlite_autoindex_languages_1", unique: true
  end

  create_table "subscriptions", id: nil, force: :cascade do |t|
    t.         "financial_movement_id"
    t.         "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["financial_movement_id"], name: "index_subscriptions_on_financial_movement_id"
    t.index ["id"], name: "sqlite_autoindex_subscriptions_1", unique: true
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "team_challenge_memberships", id: nil, force: :cascade do |t|
    t.         "team_id"
    t.         "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["challenge_id"], name: "index_team_challenge_memberships_on_challenge_id"
    t.index ["id"], name: "sqlite_autoindex_team_challenge_memberships_1", unique: true
    t.index ["team_id"], name: "index_team_challenge_memberships_on_team_id"
  end

  create_table "team_user_membership_invitations", id: nil, force: :cascade do |t|
    t.         "team_id"
    t.string   "user_email"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["id"], name: "sqlite_autoindex_team_user_membership_invitations_1", unique: true
    t.index ["team_id"], name: "index_team_user_membership_invitations_on_team_id"
  end

  create_table "team_user_memberships", id: nil, force: :cascade do |t|
    t.         "team_id"
    t.         "user_id"
    t.integer  "role"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "sqlite_autoindex_team_user_memberships_1", unique: true
    t.index ["team_id"], name: "index_team_user_memberships_on_team_id"
    t.index ["user_id"], name: "index_team_user_memberships_on_user_id"
  end

  create_table "teams", id: nil, force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["id"], name: "sqlite_autoindex_teams_1", unique: true
  end

  create_table "users", id: nil, force: :cascade do |t|
    t.string   "username"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "locale",                 default: "fr", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "facebook_id"
    t.string   "facebook_name"
    t.string   "facebook_image"
    t.string   "github_id"
    t.string   "github_name"
    t.string   "github_username"
    t.string   "github_image"
    t.string   "google_oauth2_id"
    t.string   "google_oauth2_name"
    t.string   "google_oauth2_image"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["id"], name: "sqlite_autoindex_users_1", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
