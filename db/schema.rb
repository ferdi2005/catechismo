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

ActiveRecord::Schema.define(version: 2019_09_16_141437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.datetime "apertura"
    t.datetime "chiusura"
    t.float "totale_consegnato"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "year_id"
    t.index ["user_id"], name: "index_days_on_user_id"
    t.index ["year_id"], name: "index_days_on_year_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "nome"
    t.bigint "year_id", null: false
    t.integer "anno"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["year_id"], name: "index_groups_on_year_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "nome"
    t.string "cognome"
    t.date "battesimo"
    t.string "parrocchia"
    t.date "data_di_nascita"
    t.string "luogo_di_nascita"
    t.string "padre"
    t.string "madre"
    t.bigint "telefono"
    t.bigint "cellulare"
    t.string "indirizzo"
    t.string "comune"
    t.integer "cap"
    t.boolean "nulla_osta"
    t.boolean "completo", default: true
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_people_on_group_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "year_id", null: false
    t.bigint "group_id"
    t.integer "anno"
    t.integer "quota"
    t.boolean "quota_versata"
    t.bigint "day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_subscriptions_on_day_id"
    t.index ["group_id"], name: "index_subscriptions_on_group_id"
    t.index ["person_id"], name: "index_subscriptions_on_person_id"
    t.index ["year_id"], name: "index_subscriptions_on_year_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "years", force: :cascade do |t|
    t.string "anno"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "days", "users"
  add_foreign_key "days", "years"
  add_foreign_key "groups", "years"
  add_foreign_key "people", "groups"
  add_foreign_key "subscriptions", "days"
  add_foreign_key "subscriptions", "groups"
  add_foreign_key "subscriptions", "people"
  add_foreign_key "subscriptions", "years"
end
