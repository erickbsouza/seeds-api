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

ActiveRecord::Schema[7.0].define(version: 2023_09_02_214741) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analyses", force: :cascade do |t|
    t.string "responsible"
    t.date "date_analyse"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "benefited_id", null: false
    t.index ["benefited_id"], name: "index_analyses_on_benefited_id"
  end

  create_table "analysis_results", force: :cascade do |t|
    t.integer "seeds_total"
    t.integer "high_vigor"
    t.integer "fungus"
    t.integer "physical_damage"
    t.integer "wrinkled"
    t.integer "chemical_damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "analyse_id", null: false
    t.index ["analyse_id"], name: "index_analysis_results_on_analyse_id"
  end

  create_table "benefiteds", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "analyses", "benefiteds"
  add_foreign_key "analysis_results", "analyses"
end
