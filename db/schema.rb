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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140125063856) do

  create_table "employes", :force => true do |t|
    t.string   "number"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "sex"
    t.string   "email"
    t.string   "pan"
    t.string   "designation"
    t.boolean  "active",          :default => false
    t.string   "mobile_number"
    t.datetime "date_of_joining"
    t.text     "address"
    t.integer  "last_down_ctc"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "bank_name"
    t.string   "act_number"
    t.string   "ifsc_code"
    t.string   "name_in_bank"
  end

  create_table "holidays", :force => true do |t|
    t.integer  "day"
    t.string   "wday"
    t.integer  "month"
    t.integer  "year"
    t.string   "reason"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "leaves", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "working_days"
    t.integer  "holiday_days"
    t.integer  "total_days"
    t.text     "reason_for_leave"
    t.integer  "user_id"
    t.integer  "manager_id"
    t.string   "status"
    t.text     "reason_for_rejection"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "payrolls", :force => true do |t|
    t.integer  "user_id"
    t.integer  "basic",              :default => 0
    t.integer  "hra",                :default => 0
    t.integer  "travel",             :default => 0
    t.integer  "daily",              :default => 0
    t.integer  "medical",            :default => 0
    t.integer  "other",              :default => 0
    t.integer  "variable",           :default => 0
    t.integer  "gross",              :default => 0
    t.integer  "professional_tax",   :default => 0
    t.integer  "pf",                 :default => 0
    t.integer  "esi",                :default => 0
    t.integer  "tds",                :default => 0
    t.integer  "advance_salary",     :default => 0
    t.integer  "total_deductions",   :default => 0
    t.integer  "net_salary",         :default => 0
    t.integer  "total_working_days", :default => 0
    t.integer  "working_days",       :default => 0
    t.string   "payroll_month_year"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "band"
    t.integer  "min_salary"
    t.integer  "max_salary"
    t.integer  "paid_leaves"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "salaries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "basic"
    t.integer  "hra"
    t.integer  "travel"
    t.integer  "daily"
    t.integer  "medical"
    t.integer  "other"
    t.integer  "variable"
    t.integer  "gross"
    t.integer  "professional_tax"
    t.integer  "pf"
    t.integer  "esi"
    t.integer  "total_deductions"
    t.integer  "net_salary"
    t.boolean  "active",           :default => true
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.integer  "manager_id"
    t.integer  "role_id"
    t.date     "end_date"
    t.integer  "salary"
    t.integer  "leave_used"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "sex"
    t.string   "pan"
    t.string   "designation"
    t.boolean  "active",                 :default => false
    t.string   "mobile_number"
    t.datetime "date_of_joining"
    t.text     "address"
    t.integer  "last_down_ctc"
    t.integer  "number"
    t.text     "bank_name"
    t.text     "name_in_bank"
    t.text     "act_number"
    t.text     "ifsc_code"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "employement_status"
    t.string   "image"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
