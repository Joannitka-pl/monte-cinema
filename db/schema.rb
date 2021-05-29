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

ActiveRecord::Schema.define(version: 2021_05_29_123457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email"
    t.boolean "real_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "halls", force: :cascade do |t|
    t.integer "number"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "age_limit"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id", null: false
    t.bigint "seance_id", null: false
    t.bigint "ticket_desk_id", null: false
    t.index ["client_id"], name: "index_reservations_on_client_id"
    t.index ["seance_id"], name: "index_reservations_on_seance_id"
    t.index ["ticket_desk_id"], name: "index_reservations_on_ticket_desk_id"
  end

  create_table "seances", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "movie_id", null: false
    t.bigint "hall_id", null: false
    t.date "date"
    t.time "time"
    t.index ["hall_id"], name: "index_seances_on_hall_id"
    t.index ["movie_id"], name: "index_seances_on_movie_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "row"
    t.integer "number"
    t.boolean "availability"
    t.bigint "hall_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hall_id"], name: "index_seats_on_hall_id"
  end

  create_table "ticket_desks", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "sort"
    t.decimal "price"
    t.bigint "reservation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reservation_id"], name: "index_tickets_on_reservation_id"
  end

  add_foreign_key "reservations", "clients"
  add_foreign_key "reservations", "seances"
  add_foreign_key "reservations", "ticket_desks"
  add_foreign_key "seances", "halls"
  add_foreign_key "seances", "movies"
  add_foreign_key "seats", "halls"
  add_foreign_key "tickets", "reservations"
end
