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

ActiveRecord::Schema.define(version: 20150801165338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "butacas", force: :cascade do |t|
    t.string   "uid",                            null: false
    t.string   "detail"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.integer  "status",         default: 0
    t.integer  "escenario_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "butacas", ["escenario_id"], name: "index_butacas_on_escenario_id", using: :btree
  add_index "butacas", ["uid"], name: "index_butacas_on_uid", using: :btree

  create_table "escenarios", force: :cascade do |t|
    t.string   "uid",                    null: false
    t.integer  "periodo",    default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "escenarios", ["uid"], name: "index_escenarios_on_uid", using: :btree

  create_table "expositores", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tipo_personeria", default: 0
    t.string   "country"
    t.string   "city"
    t.string   "dni",                         null: false
    t.string   "phone"
    t.string   "mobile"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "address"
    t.string   "company"
    t.string   "web_site"
    t.string   "photo"
    t.text     "details"
    t.string   "section"
    t.text     "interest"
    t.string   "alcance"
  end

  add_index "expositores", ["dni"], name: "index_expositores_on_dni", using: :btree
  add_index "expositores", ["user_id"], name: "index_expositores_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "butacas", "escenarios"
  add_foreign_key "expositores", "users"
end
