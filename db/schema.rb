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

ActiveRecord::Schema.define(version: 20150929231412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rides", force: :cascade do |t|
    t.string   "pickup"
    t.string   "dropoff"
    t.integer  "passenger_number"
    t.string   "status",           default: "active"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "driver_id"
    t.integer  "rider_id"
    t.datetime "requested_time"
    t.datetime "accepted_time"
    t.datetime "pickup_time"
    t.datetime "dropoff_time"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "password_digest"
    t.string   "role"
    t.string   "car_make"
    t.string   "car_model"
    t.integer  "passenger_cap"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
