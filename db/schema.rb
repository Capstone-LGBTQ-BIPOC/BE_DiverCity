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

ActiveRecord::Schema.define(version: 2022_05_23_153112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_recommendations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "business_yelp_id"
    t.string "recommendation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_recommendations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "zipcode"
    t.string "city"
    t.string "state"
    t.string "street_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "github"
    t.string "linkedin"
    t.string "email"
  end

  add_foreign_key "user_recommendations", "users"
end
