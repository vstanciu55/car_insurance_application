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

ActiveRecord::Schema.define(version: 20180809183544) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  add_index "addresses", ["customer_id"], name: "index_addresses_on_customer_id"

  create_table "customers", force: :cascade do |t|
    t.string   "title"
    t.string   "forename"
    t.string   "surname"
    t.string   "email"
    t.date     "date_of_birth"
    t.integer  "license_period"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "job_title"
    t.string   "current_license_type"
  end

  create_table "driverhistories", force: :cascade do |t|
    t.integer  "no_of_incidents"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "customer_id"
  end

  add_index "driverhistories", ["customer_id"], name: "index_driverhistories_on_customer_id"

  create_table "incidents", force: :cascade do |t|
    t.date     "date_of_incident"
    t.integer  "value"
    t.string   "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "type_of_incident"
    t.integer  "customer_id"
  end

  add_index "incidents", ["customer_id"], name: "index_incidents_on_customer_id"

  create_table "occupations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  add_index "occupations", ["customer_id"], name: "index_occupations_on_customer_id"

  create_table "premia", force: :cascade do |t|
    t.integer  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  add_index "premia", ["customer_id"], name: "index_premia_on_customer_id"

  create_table "vehicles", force: :cascade do |t|
    t.string   "vehicle_registration"
    t.integer  "estimated_annual_mileage"
    t.integer  "estimated_vehicle_value"
    t.string   "typical_parking_location"
    t.date     "policy_start_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "customer_id"
  end

end
