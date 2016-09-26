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

ActiveRecord::Schema.define(version: 20160915082403) do

  create_table "jeux_videos", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.text     "comments"
    t.integer  "nb_joueur"
    t.string   "server"
    t.string   "champion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  add_index "tournois", ["jeux_videos_id"], name: "index_tournois_on_jeux_videos_id"
  add_index "tournois", ["matchs_id"], name: "index_tournois_on_matchs_id"
  add_index "tournois", ["users_id"], name: "index_tournois_on_users_id"

  create_table "users", force: :cascade do |t|
    t.integer  "tournoi_id"
    t.string   "pseudo",                 default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.boolean  "admin",                               null: false
    t.integer  "age"
    t.string   "sexe"
    t.string   "pays"
    t.string   "description"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["tournoi_id"], name: "index_users_on_tournoi_id"
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
