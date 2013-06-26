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

ActiveRecord::Schema.define(version: 20130626104311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: true do |t|
    t.integer  "ordinal"
    t.string   "name"
    t.string   "logo"
    t.string   "slug"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["ordinal"], name: "index_clients_on_ordinal", using: :btree

  create_table "featured_videos", force: true do |t|
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "featured_videos", ["video_id"], name: "index_featured_videos_on_video_id", using: :btree

  create_table "homepage_videos", force: true do |t|
    t.integer  "ordinal"
    t.string   "video"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "category"
    t.integer  "ordinal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.integer  "ordinal"
    t.string   "name"
    t.integer  "tag_ordinal"
    t.integer  "tag_id"
    t.string   "slug"
    t.string   "vimeoid"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "blurb"
  end

  add_index "videos", ["tag_id", "tag_ordinal", "ordinal"], name: "index_videos_on_tag_id_and_tag_ordinal_and_ordinal", using: :btree

end
