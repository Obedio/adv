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

ActiveRecord::Schema.define(version: 20170426205008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "addresstype"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "client_id"
    t.index ["client_id"], name: "index_addresses_on_client_id", using: :btree
  end

  create_table "annexes", force: :cascade do |t|
    t.text     "description"
    t.integer  "lawsuit_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "document"
    t.index ["lawsuit_id"], name: "index_annexes_on_lawsuit_id", using: :btree
    t.index ["user_id"], name: "index_annexes_on_user_id", using: :btree
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
    t.string   "lastname"
    t.index ["user_id"], name: "index_clients_on_user_id", using: :btree
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
    t.text     "obs"
    t.float    "amount_rest"
    t.index ["client_id"], name: "index_lawsuits_on_client_id", using: :btree
    t.index ["kind_id"], name: "index_lawsuits_on_kind_id", using: :btree
    t.index ["status_id"], name: "index_lawsuits_on_status_id", using: :btree
    t.index ["user_id"], name: "index_lawsuits_on_user_id", using: :btree
    t.index ["venue_id"], name: "index_lawsuits_on_venue_id", using: :btree
  end

  create_table "observations", force: :cascade do |t|
    t.text     "description"
    t.integer  "lawsuit_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.index ["lawsuit_id"], name: "index_observations_on_lawsuit_id", using: :btree
    t.index ["user_id"], name: "index_observations_on_user_id", using: :btree
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
    t.index ["lawsuit_id"], name: "index_payments_on_lawsuit_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.date     "birth"
    t.string   "sex"
    t.integer  "user_id"
    t.integer  "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_profiles_on_office_id", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "shares", force: :cascade do |t|
    t.integer  "lawsuit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.index ["lawsuit_id"], name: "index_shares_on_lawsuit_id", using: :btree
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "clients"
  add_foreign_key "annexes", "lawsuits"
  add_foreign_key "annexes", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "lawsuits", "clients"
  add_foreign_key "lawsuits", "kinds"
  add_foreign_key "lawsuits", "statuses"
  add_foreign_key "lawsuits", "users"
  add_foreign_key "lawsuits", "venues"
  add_foreign_key "observations", "lawsuits"
  add_foreign_key "observations", "users"
  add_foreign_key "payments", "lawsuits"
  add_foreign_key "profiles", "offices"
  add_foreign_key "profiles", "users"
  add_foreign_key "shares", "lawsuits"
end
