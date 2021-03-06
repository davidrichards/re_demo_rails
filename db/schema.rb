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

ActiveRecord::Schema.define(version: 20170714162135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.text "description"
    t.string "url"
    t.string "avatar_url"
  end

  create_table "people", force: :cascade do |t|
    t.string "token"
    t.index ["token"], name: "index_people_on_token"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "item_id"
    t.float "value"
    t.index ["item_id"], name: "index_scores_on_item_id"
    t.index ["person_id"], name: "index_scores_on_person_id"
  end

  add_foreign_key "scores", "items"
  add_foreign_key "scores", "people"
end
