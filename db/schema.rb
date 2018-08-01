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

ActiveRecord::Schema.define(version: 20180720012413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "type"
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.string   "attachment"
    t.string   "original_filename"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "compositions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "title"
    t.string   "description"
    t.text     "content"
    t.boolean  "published",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  add_index "compositions", ["project_id"], name: "index_compositions_on_project_id", using: :btree
  add_index "compositions", ["user_id"], name: "index_compositions_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "collaborative",      default: false
    t.boolean  "published",          default: false
    t.integer  "compositions_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "type"
    t.integer  "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "name"
  end

  add_index "roles", ["start_date", "end_date"], name: "index_roles_on_start_date_and_end_date", using: :btree
  add_index "roles", ["user_id", "start_date", "end_date"], name: "index_roles_on_user_id_and_start_date_and_end_date", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "username"
    t.string   "bio"
    t.string   "role",                   default: "Reader"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "type"
    t.string   "name"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
