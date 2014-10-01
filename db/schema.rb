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

ActiveRecord::Schema.define(version: 20141001062154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imgur_albums", force: true do |t|
    t.string   "imgur_id"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imgur_images", force: true do |t|
    t.string   "imgur_id"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "gallery_id"
    t.string   "name"
    t.integer  "price",          default: 0
    t.string   "description"
    t.boolean  "for_sale",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "imgur_image_id"
  end

  create_table "items_tags", id: false, force: true do |t|
    t.integer "item_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "items_tags", ["item_id", "tag_id"], name: "index_items_tags_on_item_id_and_tag_id", using: :btree
  add_index "items_tags", ["tag_id", "item_id"], name: "index_items_tags_on_tag_id_and_item_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "primary_item_id"
    t.string   "description"
    t.integer  "imgur_album_id"
  end

end
