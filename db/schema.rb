# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161205135755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "author_name"
    t.text     "body"
    t.string   "rating"
    t.integer  "jeux_video_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "comments", ["jeux_video_id"], name: "index_comments_on_jeux_video_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "jeux_video_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "favorites", ["jeux_video_id"], name: "index_favorites_on_jeux_video_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "favorites_users", id: false, force: :cascade do |t|
    t.integer "favorite_id", null: false
    t.integer "user_id",     null: false
  end

  add_index "favorites_users", ["favorite_id", "user_id"], name: "index_favorites_users_on_favorite_id_and_user_id", using: :btree
  add_index "favorites_users", ["user_id", "favorite_id"], name: "index_favorites_users_on_user_id_and_favorite_id", using: :btree

  create_table "jeux_videos", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.text     "commentaire"
    t.integer  "nb_joueur"
    t.string   "server"
    t.string   "champion"
    t.integer  "users_count"
    t.integer  "users_id"
    t.integer  "tournois_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "jeux_videos", ["tournois_id"], name: "index_jeux_videos_on_tournois_id", using: :btree
  add_index "jeux_videos", ["users_id"], name: "index_jeux_videos_on_users_id", using: :btree

  create_table "jeux_videos_users", id: false, force: :cascade do |t|
    t.integer "jeux_video_id", null: false
    t.integer "user_id",       null: false
  end

  add_index "jeux_videos_users", ["jeux_video_id", "user_id"], name: "index_jeux_videos_users_on_jeux_video_id_and_user_id", using: :btree
  add_index "jeux_videos_users", ["user_id", "jeux_video_id"], name: "index_jeux_videos_users_on_user_id_and_jeux_video_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.integer  "score_player1"
    t.integer  "score_player2"
    t.integer  "winner_id"
    t.integer  "user_id"
    t.integer  "tournoi_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "matches", ["tournoi_id"], name: "index_matches_on_tournoi_id", using: :btree
  add_index "matches", ["user_id"], name: "index_matches_on_user_id", using: :btree

  create_table "matches_users", id: false, force: :cascade do |t|
    t.integer "match_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "matches_users", ["match_id", "user_id"], name: "index_matches_users_on_match_id_and_user_id", using: :btree
  add_index "matches_users", ["user_id", "match_id"], name: "index_matches_users_on_user_id_and_match_id", using: :btree

  create_table "tournois", force: :cascade do |t|
    t.string   "title"
    t.string   "pays"
    t.string   "lieu"
    t.datetime "date"
    t.datetime "heure_inscription"
    t.text     "regles"
    t.string   "jeux_proposés"
    t.integer  "nb_joueurs_max"
    t.text     "recompenses"
    t.string   "niveau_de_jeu"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "winner"
    t.integer  "users_count"
    t.integer  "users_id"
    t.integer  "matchs_id"
    t.integer  "jeux_videos_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "tournois", ["jeux_videos_id"], name: "index_tournois_on_jeux_videos_id", using: :btree
  add_index "tournois", ["matchs_id"], name: "index_tournois_on_matchs_id", using: :btree
  add_index "tournois", ["users_id"], name: "index_tournois_on_users_id", using: :btree

  create_table "tournois_users", id: false, force: :cascade do |t|
    t.integer "tournoi_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "tournois_users", ["tournoi_id", "user_id"], name: "index_tournois_users_on_tournoi_id_and_user_id", using: :btree
  add_index "tournois_users", ["user_id", "tournoi_id"], name: "index_tournois_users_on_user_id_and_tournoi_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "pseudo",                 default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.boolean  "admin"
    t.integer  "age"
    t.string   "sexe"
    t.string   "pays"
    t.string   "ville"
    t.string   "adresse"
    t.string   "description"
    t.integer  "points"
    t.integer  "win"
    t.integer  "tie"
    t.integer  "loose"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "tournois_id"
    t.integer  "jeux_videos_id"
    t.integer  "matches_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["jeux_videos_id"], name: "index_users_on_jeux_videos_id", using: :btree
  add_index "users", ["matches_id"], name: "index_users_on_matches_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["tournois_id"], name: "index_users_on_tournois_id", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
