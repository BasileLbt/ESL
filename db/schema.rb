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

ActiveRecord::Schema.define(version: 20160928102221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jeux_videos", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.text     "comments"
    t.integer  "nb_joueur"
    t.string   "server"
    t.string   "champion"
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
