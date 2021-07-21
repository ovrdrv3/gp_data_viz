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

ActiveRecord::Schema.define(version: 2021_07_21_083921) do

  create_table "data_sets", force: :cascade do |t|
    t.text "FIRST NAME"
    t.text "MIDDLE INITIAL"
    t.text "LAST NAME"
    t.text "PREFIX"
    t.text "ADDRESS 1"
    t.text "ADDRESS 2"
    t.text "CITY"
    t.text "STATE"
    t.text "ZIP CODE"
    t.text "EDUCATION"
    t.text "ESTIMATED INCOME"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
