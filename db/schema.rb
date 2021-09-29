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

ActiveRecord::Schema.define(version: 2021_09_29_154605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basket_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "basket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["basket_id"], name: "index_basket_tags_on_basket_id"
    t.index ["tag_id"], name: "index_basket_tags_on_tag_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.string "name"
    t.time "pickup_min"
    t.time "pickup_max"
    t.integer "price"
    t.text "description"
    t.integer "stock"
    t.bigint "restaurant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_baskets_on_restaurant_id"
  end

  create_table "cart_baskets", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "basket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
    t.index ["basket_id"], name: "index_cart_baskets_on_basket_id"
    t.index ["cart_id"], name: "index_cart_baskets_on_cart_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "price"
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_baskets", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "basket_id", null: false
    t.string "name"
    t.string "description"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
    t.index ["basket_id"], name: "index_orders_baskets_on_basket_id"
    t.index ["order_id"], name: "index_orders_baskets_on_order_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "basket_tags", "baskets"
  add_foreign_key "basket_tags", "tags"
  add_foreign_key "cart_baskets", "baskets"
  add_foreign_key "cart_baskets", "carts"
  add_foreign_key "carts", "users"
  add_foreign_key "orders_baskets", "baskets"
  add_foreign_key "orders_baskets", "orders"
  add_foreign_key "restaurants", "users"
end
