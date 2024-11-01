# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_30_202349) do
  create_table "episodes", force: :cascade do |t|
    t.string "episode_name"
    t.text "overview"
    t.integer "episode_number"
    t.decimal "vote_average"
    t.string "still_path"
    t.integer "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "season_name"
    t.integer "number_of_episodes"
    t.string "poster_path"
    t.decimal "vote_average"
    t.integer "show_detail_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "overview"
    t.index ["show_detail_id"], name: "index_seasons_on_show_detail_id"
  end

  create_table "show_details", force: :cascade do |t|
    t.string "name"
    t.text "overview"
    t.integer "number_of_episodes"
    t.integer "number_of_seasons"
    t.integer "show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_show_details_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "title"
    t.text "overview"
    t.string "image"
    t.integer "show_id"
    t.decimal "avg_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "episodes", "seasons"
  add_foreign_key "seasons", "show_details"
  add_foreign_key "show_details", "shows"
end
