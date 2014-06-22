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

ActiveRecord::Schema.define(version: 20140621190642) do

  create_table "lendings", force: true do |t|
    t.integer  "user_id"
    t.integer  "publication_id"
    t.datetime "expire_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expired_at"
  end

  add_index "lendings", ["publication_id"], name: "index_lendings_on_publication_id"
  add_index "lendings", ["user_id"], name: "index_lendings_on_user_id"

  create_table "libraries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subdomain"
  end

  create_table "publications", force: true do |t|
    t.integer  "library_id"
    t.string   "isbn"
    t.string   "issn"
    t.integer  "age_limit"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.string   "name"
    t.integer  "count"
    t.integer  "remain"
  end

  add_index "publications", ["library_id"], name: "index_publications_on_library_id"

  create_table "reservations", force: true do |t|
    t.integer  "user_id"
    t.integer  "publication_id"
    t.datetime "expire_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expired_at"
  end

  add_index "reservations", ["publication_id"], name: "index_reservations_on_publication_id"
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
