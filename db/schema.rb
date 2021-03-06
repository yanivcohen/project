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

ActiveRecord::Schema.define(version: 20131109205001) do

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "edition"
    t.string   "author"
    t.string   "isbn"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "book_vector"
  end

  create_table "copies", force: true do |t|
    t.float    "price"
    t.string   "condition"
    t.integer  "book_id"
    t.string   "seller"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sold",       default: false
    t.integer  "user_id"
  end

  add_index "copies", ["book_id", "created_at"], name: "index_copies_on_book_id_and_created_at"

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "copy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professors", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "department"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.integer  "professor_id"
    t.integer  "value"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["professor_id"], name: "index_ratings_on_professor_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
