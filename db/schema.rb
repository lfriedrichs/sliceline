# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_04_181150) do

  create_table "carts", force: :cascade do |t|
    t.integer "order_id"
    t.integer "item_id"
    t.integer "quantity"
    t.float "item_price"
  end

  create_table "coupon_items", force: :cascade do |t|
    t.integer "coupon_id"
    t.integer "item_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "discount"
    t.datetime "expiration_date"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "description"
    t.string "tax_type"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "phone_number"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.float "food_tax"
    t.float "alcohol_tax"
    t.float "delivery_fee"
  end

  create_table "menus", force: :cascade do |t|
    t.integer "location_id"
    t.integer "item_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_number"
    t.integer "location_id"
    t.string "type"
    t.integer "sub_total_price"
    t.integer "tax"
    t.integer "delivery_fee"
    t.integer "tip"
    t.integer "total_price"
    t.string "payment_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.integer "phone_number"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
  end

end
