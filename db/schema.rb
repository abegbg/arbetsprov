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

ActiveRecord::Schema.define(version: 20160201093248) do

  create_table "cartrows", force: true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cartrows", ["cart_id"], name: "index_cartrows_on_cart_id"
  add_index "cartrows", ["product_id"], name: "index_cartrows_on_product_id"

  create_table "carts", force: true do |t|
    t.string   "mac"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orderrows", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orderrows", ["order_id"], name: "index_orderrows_on_order_id"
  add_index "orderrows", ["product_id"], name: "index_orderrows_on_product_id"

  create_table "orders", force: true do |t|
    t.string   "name"
    t.string   "adress"
    t.string   "co"
    t.string   "zipcode"
    t.string   "city"
    t.string   "country"
    t.string   "d_adress"
    t.string   "d_co"
    t.string   "d_city"
    t.string   "d_country"
    t.string   "d_zipcode"
    t.string   "email"
    t.string   "mobile"
    t.integer  "status",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description", limit: 255
    t.decimal  "price"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

end
