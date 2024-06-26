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

ActiveRecord::Schema[7.0].define(version: 2024_06_07_140616) do
  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "choices", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "value"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_type", default: 0
    t.integer "student_assignment_id", null: false
    t.index ["student_assignment_id"], name: "index_events_on_student_assignment_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "test_id", null: false
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "student_assignments", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "assignment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignment_id"], name: "index_student_assignments_on_assignment_id"
    t.index ["student_id"], name: "index_student_assignments_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_memberships", force: :cascade do |t|
    t.integer "test_taker_id", null: false
    t.integer "test_id", null: false
    t.datetime "last_access"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_test_memberships_on_test_id"
    t.index ["test_taker_id"], name: "index_test_memberships_on_test_taker_id"
  end

  create_table "test_takers", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
    t.index ["name"], name: "index_tests_on_name", unique: true
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "permissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "choices", "questions"
  add_foreign_key "events", "student_assignments"
  add_foreign_key "questions", "tests"
  add_foreign_key "student_assignments", "assignments"
  add_foreign_key "student_assignments", "students"
  add_foreign_key "test_memberships", "test_takers"
  add_foreign_key "test_memberships", "tests"
  add_foreign_key "tests", "users"
end
