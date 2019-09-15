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

ActiveRecord::Schema.define(version: 2019_09_15_130316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anni", force: :cascade do |t|
    t.string "anno"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "days", force: :cascade do |t|
    t.datetime "apertura"
    t.datetime "chiusura"
    t.float "totale_consegnato"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "giornate", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "nome"
    t.bigint "year_id", null: false
    t.integer "anno"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["year_id"], name: "index_groups_on_year_id"
  end

  create_table "gruppi", force: :cascade do |t|
    t.string "nome"
    t.bigint "anno_id", null: false
    t.integer "anno_di_catechismo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anno_id"], name: "index_gruppi_on_anno_id"
  end

  create_table "iscritti", force: :cascade do |t|
    t.string "nome"
    t.string "cognome"
    t.date "battesimo"
    t.string "parrocchia_di_origine"
    t.date "data_di_nascita"
    t.string "luogo_di_nascita"
    t.string "padre"
    t.string "madre"
    t.integer "telefono"
    t.integer "cellulare"
    t.string "indirizzo"
    t.string "comune"
    t.integer "cap"
    t.boolean "nulla_osta"
    t.bigint "gruppo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gruppo_id"], name: "index_iscritti_on_gruppo_id"
  end

  create_table "iscrizioni", force: :cascade do |t|
    t.bigint "iscritto_id", null: false
    t.bigint "anno_id", null: false
    t.bigint "gruppo_id", null: false
    t.boolean "primo_anno"
    t.integer "quota"
    t.boolean "quota_versata"
    t.bigint "giornata_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anno_id"], name: "index_iscrizioni_on_anno_id"
    t.index ["giornata_id"], name: "index_iscrizioni_on_giornata_id"
    t.index ["gruppo_id"], name: "index_iscrizioni_on_gruppo_id"
    t.index ["iscritto_id"], name: "index_iscrizioni_on_iscritto_id"
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
    t.integer "telefono"
    t.integer "cellulare"
    t.string "indirizzo"
    t.string "comune"
    t.integer "cap"
    t.boolean "nulla_osta"
    t.boolean "completo", default: true
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_people_on_group_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "year_id", null: false
    t.bigint "group_id", null: false
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

  create_table "utenti", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "years", force: :cascade do |t|
    t.string "anno"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "groups", "years"
  add_foreign_key "gruppi", "anni", column: "anno_id"
  add_foreign_key "iscritti", "gruppi", column: "gruppo_id"
  add_foreign_key "iscrizioni", "anni", column: "anno_id"
  add_foreign_key "iscrizioni", "giornate", column: "giornata_id"
  add_foreign_key "iscrizioni", "gruppi", column: "gruppo_id"
  add_foreign_key "iscrizioni", "iscritti", column: "iscritto_id"
  add_foreign_key "people", "groups"
  add_foreign_key "subscriptions", "days"
  add_foreign_key "subscriptions", "groups"
  add_foreign_key "subscriptions", "people"
  add_foreign_key "subscriptions", "years"
end
