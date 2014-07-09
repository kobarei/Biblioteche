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

ActiveRecord::Schema.define(version: 20140622160911) do

  create_table "books", force: true do |t|
    t.integer  "library_id"
    t.integer  "age_limit"
    t.integer  "status"
    t.string   "author"
    t.string   "name"
    t.integer  "count"
    t.integer  "remain"
    t.string   "isbn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["library_id"], name: "index_books_on_library_id"

  create_table "borrowings", force: true do |t|
    t.integer  "user_id"
    t.datetime "expire_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expired_at"
    t.integer  "book_id"
    t.integer  "magazine_id"
  end

  add_index "borrowings", ["book_id"], name: "index_borrowings_on_book_id"
  add_index "borrowings", ["magazine_id"], name: "index_borrowings_on_magazine_id"
  add_index "borrowings", ["user_id"], name: "index_borrowings_on_user_id"

  create_table "libraries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subdomain"
  end

  create_table "magazines", force: true do |t|
    t.integer  "library_id"
    t.integer  "age_limit"
    t.integer  "status"
    t.string   "author"
    t.string   "name"
    t.integer  "count"
    t.integer  "remain"
    t.string   "issn"
    t.integer  "interval"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "magazines", ["library_id"], name: "index_magazines_on_library_id"

  create_table "publications", force: true do |t|
    t.integer  "library_id"
    t.integer  "age_limit"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.string   "name"
    t.integer  "count"
    t.integer  "remain"
    t.string   "category"
  end

  add_index "publications", ["library_id"], name: "index_publications_on_library_id"

  create_table "reservations", force: true do |t|
    t.integer  "user_id"
    t.datetime "expire_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expired_at"
    t.integer  "book_id"
    t.integer  "magazine_id"
  end

  add_index "reservations", ["book_id"], name: "index_reservations_on_book_id"
  add_index "reservations", ["magazine_id"], name: "index_reservations_on_magazine_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "staffs", force: true do |t|
    t.string   "name"
    t.integer  "library_id"
    t.string   "login_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "staffs", ["library_id"], name: "index_staffs_on_library_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "library_id"
    t.string   "login_id"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "users", ["library_id"], name: "index_users_on_library_id"

end
