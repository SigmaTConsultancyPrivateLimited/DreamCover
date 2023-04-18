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

ActiveRecord::Schema[7.0].define(version: 2023_03_28_052308) do
  create_table "addresses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "flat_no"
    t.string "house_name"
    t.string "street_name"
    t.integer "city_id"
    t.integer "district_id"
    t.integer "state_id"
    t.integer "country_id"
    t.integer "pincode"
  end

  create_table "cart_logs", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "initial_value"
    t.integer "final_value"
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.integer "total_items"
    t.integer "sub_total"
    t.integer "total_unique_items"
    t.boolean "available_discounts"
    t.string "currency"
    t.integer "user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_unique_id"
    t.string "cart_unique_id"
    t.string "invoice_unique_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "total"
    t.integer "cart_id"
    t.integer "payment_id"
    t.integer "quantity"
    t.string "delivery_status"
    t.string "product_id"
    t.string "customer_name"
    t.string "customer_address"
    t.string "user_profile"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_customer_id"
    t.string "payment_desc"
    t.string "payment_amount"
    t.datetime "date"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_name"
    t.integer "product_code"
    t.string "product_image"
    t.integer "price"
    t.integer "quantity"
    t.string "user_unique_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "phone_number"
    t.string "file_extension"
    t.string "language"
    t.string "roles", default: "user"
  end

end
