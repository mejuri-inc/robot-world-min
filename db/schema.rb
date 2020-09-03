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

ActiveRecord::Schema.define(version: 2020_09_03_144946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.bigint "car_model_id"
    t.integer "year"
    t.string "status"
    t.string "stage"
    t.boolean "wheels"
    t.boolean "chassis"
    t.boolean "lasser"
    t.boolean "computer"
    t.boolean "engine"
    t.boolean "seat"
    t.bigint "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_model_id"], name: "index_cars_on_car_model_id"
    t.index ["stock_id"], name: "index_cars_on_stock_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "success_transaction"
    t.bigint "car_model_id"
    t.index ["car_id"], name: "index_orders_on_car_id"
    t.index ["car_model_id"], name: "index_orders_on_car_model_id"
  end

  create_table "out_stock_reports", force: :cascade do |t|
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_out_stock_reports_on_order_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cars", "car_models"
  add_foreign_key "cars", "stocks"
  add_foreign_key "orders", "car_models"
  add_foreign_key "orders", "cars"
  add_foreign_key "out_stock_reports", "orders"
end
