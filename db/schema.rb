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

ActiveRecord::Schema.define(version: 20150908001805) do

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

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string   "country",         default: "EC"
    t.string   "phone"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "address"
    t.string   "company"
    t.string   "web_site"
    t.string   "photo"
    t.text     "details"
    t.text     "interest"
    t.string   "alcance"
    t.string   "name",                           null: false
    t.integer  "category_id",                    null: false
    t.string   "facebook"
    t.string   "twitter"
    t.string   "skype"
    t.string   "instagram"
    t.string   "slug"
  end

  add_index "expositores", ["category_id"], name: "index_expositores_on_category_id", using: :btree
  add_index "expositores", ["slug"], name: "index_expositores_on_slug", unique: true, using: :btree
  add_index "expositores", ["user_id"], name: "index_expositores_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "meetings", force: :cascade do |t|
    t.integer  "source_id",              null: false
    t.integer  "target_id",              null: false
    t.string   "time",                   null: false
    t.integer  "status",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "meetings", ["source_id"], name: "index_meetings_on_source_id", using: :btree
  add_index "meetings", ["target_id"], name: "index_meetings_on_target_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  add_foreign_key "butacas", "escenarios"
  add_foreign_key "expositores", "users"
end
