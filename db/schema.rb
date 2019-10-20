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

ActiveRecord::Schema.define(version: 2019_10_20_175352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_balances", force: :cascade do |t|
    t.integer "amount"
    t.bigint "product_entry_id"
    t.bigint "product_exit_id"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_entry_id"], name: "index_product_balances_on_product_entry_id"
    t.index ["product_exit_id"], name: "index_product_balances_on_product_exit_id"
    t.index ["product_id"], name: "index_product_balances_on_product_id"
  end

  create_table "product_entries", force: :cascade do |t|
    t.string "payment_date"
    t.date "forecast_receipt_date"
    t.date "receipt_date"
    t.integer "amount"
    t.decimal "price"
    t.string "observation"
    t.bigint "product_id", null: false
    t.bigint "supplier_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_entries_on_product_id"
    t.index ["supplier_id"], name: "index_product_entries_on_supplier_id"
  end

  create_table "product_exits", force: :cascade do |t|
    t.integer "amount"
    t.decimal "price"
    t.string "observation"
    t.decimal "comission"
    t.bigint "product_id", null: false
    t.bigint "seller_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_exits_on_product_id"
    t.index ["seller_id"], name: "index_product_exits_on_seller_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.decimal "comission"
    t.bigint "category_id"
    t.bigint "subcategory_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["subcategory_id"], name: "index_products_on_subcategory_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "description"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "cpf", default: ""
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.string "login", default: "", null: false
    t.string "telephone", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "product_balances", "product_entries"
  add_foreign_key "product_balances", "product_exits"
  add_foreign_key "product_balances", "products"
  add_foreign_key "product_entries", "products"
  add_foreign_key "product_entries", "suppliers"
  add_foreign_key "product_exits", "products"
  add_foreign_key "product_exits", "sellers"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "subcategories"
  add_foreign_key "subcategories", "categories"
end
