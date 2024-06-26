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

ActiveRecord::Schema[7.1].define(version: 2024_05_08_062539) do
  create_table "buffet_owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_buffet_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_buffet_owners_on_reset_password_token", unique: true
  end

  create_table "buffets", force: :cascade do |t|
    t.string "brand_name"
    t.string "corporate_name"
    t.string "cnpj"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.string "district"
    t.string "state"
    t.string "city"
    t.string "cep"
    t.text "description"
    t.string "payment_method"
    t.integer "buffet_owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buffet_owner_id"], name: "index_buffets_on_buffet_owner_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf"
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "min_quantity"
    t.integer "max_quantity"
    t.integer "duration"
    t.text "menu"
    t.boolean "alcoholic_drink"
    t.boolean "party_decoration"
    t.boolean "valet_service"
    t.integer "buffet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "local"
    t.decimal "weekend_base_price", precision: 10, scale: 2
    t.decimal "weekend_additional_price_person", precision: 10, scale: 2
    t.decimal "weekend_additional_price_hour", precision: 10, scale: 2
    t.decimal "weekday_base_price", precision: 10, scale: 2
    t.decimal "weekday_additional_price_person", precision: 10, scale: 2
    t.decimal "weekday_additional_price_hour", precision: 10, scale: 2
    t.index ["buffet_id"], name: "index_events_on_buffet_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "buffet_id", null: false
    t.integer "event_id", null: false
    t.date "date"
    t.integer "quantity"
    t.text "details"
    t.string "code"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_method"
    t.decimal "extra_fee", precision: 10, scale: 2
    t.decimal "discount", precision: 10, scale: 2
    t.text "fee_or_discount_reason"
    t.date "payment_validity"
    t.boolean "payment_done"
    t.index ["buffet_id"], name: "index_orders_on_buffet_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["event_id"], name: "index_orders_on_event_id"
  end

  add_foreign_key "buffets", "buffet_owners"
  add_foreign_key "events", "buffets"
  add_foreign_key "orders", "buffets"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "events"
end
