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

ActiveRecord::Schema.define(version: 20170402022045) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "client_id"
    t.string   "addresstype"
    t.index ["client_id"], name: "index_addresses_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.date     "born"
    t.string   "sex"
    t.string   "cpf"
    t.string   "rg"
    t.string   "email"
    t.string   "telephone"
    t.string   "celphone"
    t.text     "bio"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "address_id"
    t.string   "lastname"
    t.index ["address_id"], name: "index_clients_on_address_id"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "data_users", force: :cascade do |t|
    t.string   "name"
    t.date     "born"
    t.string   "sex"
    t.integer  "office_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_data_users_on_office_id"
    t.index ["user_id"], name: "index_data_users_on_user_id"
  end

  create_table "kinds", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lawsuits", force: :cascade do |t|
    t.string   "number"
    t.date     "assessment"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "venue_id"
    t.integer  "kind_id"
    t.integer  "status_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "amount"
    t.float    "amount_paid"
    t.float    "amount_rest"
    t.index ["client_id"], name: "index_lawsuits_on_client_id"
    t.index ["kind_id"], name: "index_lawsuits_on_kind_id"
    t.index ["status_id"], name: "index_lawsuits_on_status_id"
    t.index ["user_id"], name: "index_lawsuits_on_user_id"
    t.index ["venue_id"], name: "index_lawsuits_on_venue_id"
  end

  create_table "observations", force: :cascade do |t|
    t.text     "description"
    t.integer  "lawsuit_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["lawsuit_id"], name: "index_observations_on_lawsuit_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "lawsuit_id"
    t.index ["lawsuit_id"], name: "index_payments_on_lawsuit_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role",                   default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
