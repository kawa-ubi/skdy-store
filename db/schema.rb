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

ActiveRecord::Schema.define(version: 20150622014924) do

  create_table "books", force: true do |t|
    t.string   "isbn"
    t.string   "title"
    t.string   "author"
    t.integer  "price"
    t.integer  "category_id"
    t.string   "icon_path"
    t.string   "picture_path"
    t.text     "description"
    t.integer  "display_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["category_id"], name: "index_books_on_category_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "display_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
