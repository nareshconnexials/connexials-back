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

ActiveRecord::Schema[7.0].define(version: 2023_03_15_131518) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_logs", force: :cascade do |t|
    t.string "reciepents_email_addresses"
    t.datetime "status_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "allowances", force: :cascade do |t|
    t.float "basic_salary"
    t.float "hra"
    t.float "special_allowance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bank_details", force: :cascade do |t|
    t.integer "employment_id"
    t.string "bank_ac_no"
    t.string "bank_name"
    t.string "ifsc_code"
    t.string "pan_no"
    t.string "uan_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "Address"
    t.string "Zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deductions", force: :cascade do |t|
    t.float "pf"
    t.float "epf"
    t.float "tds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "allowance_id"
    t.integer "deduction_id"
    t.string "designation"
    t.string "department"
    t.datetime "date_of_joining"
    t.string "project_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payslip_details", force: :cascade do |t|
    t.float "amount"
    t.string "name"
    t.integer "category"
    t.bigint "payslip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payslip_id"], name: "index_payslip_details_on_payslip_id"
  end

  create_table "payslips", force: :cascade do |t|
    t.integer "employment_id"
    t.date "from_date"
    t.date "to_date"
    t.datetime "month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "gross_salary"
    t.float "net_salary"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "domain"
    t.datetime "start_date"
    t.bigint "rate"
    t.string "currency"
    t.string "project_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.float "working_hours"
    t.string "status"
    t.string "description"
    t.bigint "activity_log_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_log_id"], name: "index_tasks_on_activity_log_id"
  end

  create_table "timeoff_allocations", force: :cascade do |t|
    t.integer "timeoff_id"
    t.datetime "month"
    t.float "credit"
    t.float "leave"
    t.float "penalty"
    t.float "compoff"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeoffs", force: :cascade do |t|
    t.integer "user_id"
    t.date "from_date"
    t.date "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "leave_type"
    t.integer "session_start"
    t.integer "session_end"
    t.string "notes"
    t.integer "status"
    t.index ["from_date"], name: "index_timeoffs_on_from_date"
    t.index ["to_date"], name: "index_timeoffs_on_to_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "payslip_details", "payslips"
  add_foreign_key "tasks", "activity_logs"
end
