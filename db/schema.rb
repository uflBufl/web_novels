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

ActiveRecord::Schema.define(version: 2019_10_06_183054) do

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "author"
    t.integer "first_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_page_id"], name: "index_games_on_first_page_id"
    t.index ["name", "author"], name: "index_games_on_name_and_author"
  end

  create_table "messages", force: :cascade do |t|
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
  end

  create_table "picks", force: :cascade do |t|
    t.text "context"
    t.integer "message_id"
    t.integer "transmit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_picks_on_message_id"
    t.index ["transmit_id"], name: "index_picks_on_transmit_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.integer "page_testplay"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
