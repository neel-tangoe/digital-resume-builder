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

ActiveRecord::Schema.define(version: 2022_02_02_081230) do

  create_table "awards", charset: "utf8mb4", force: :cascade do |t|
    t.integer "resume_id", null: false
    t.string "name", limit: 50, null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "educations", charset: "utf8mb4", force: :cascade do |t|
    t.integer "resume_id", null: false
    t.date "date_from"
    t.date "date_to"
    t.string "level"
    t.text "description"
    t.string "place"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", charset: "utf8mb4", force: :cascade do |t|
    t.integer "resume_id", null: false
    t.string "name", limit: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", charset: "utf8mb4", force: :cascade do |t|
    t.integer "resume_id", null: false
    t.string "client"
    t.text "description"
    t.text "technologies"
    t.integer "role", default: 0, null: false
    t.string "level"
    t.integer "team_size"
    t.date "date_from"
    t.date "date_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "resumes", charset: "utf8mb4", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", limit: 50, null: false
    t.string "phone_number", limit: 50
    t.text "general_info"
    t.text "interests"
    t.integer "gender", default: 0, null: false
    t.date "birthdate"
    t.text "address"
    t.string "country", limit: 50
    t.string "website", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", charset: "utf8mb4", force: :cascade do |t|
    t.integer "resume_id", null: false
    t.string "section"
    t.string "title"
    t.integer "percent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
