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

ActiveRecord::Schema.define(:version => 20130527023350) do

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "address"
    t.text     "complement"
    t.string   "neighborhood"
    t.integer  "zip_code"
    t.integer  "phone"
    t.integer  "mobile"
    t.integer  "fax"
    t.integer  "cnpj_cpf"
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "description"
    t.float    "hour_estimated"
    t.float    "hour_used"
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "task_id"
    t.integer  "type_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "items", ["task_id"], :name => "index_items_on_task_id"
  add_index "items", ["type_id"], :name => "index_items_on_type_id"
  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "customer_id"
    t.date     "date_begin"
    t.date     "date_end"
    t.text     "brainstorm"
  end

  add_index "projects", ["brainstorm"], :name => "index_projects_on_brainstorm"
  add_index "projects", ["customer_id"], :name => "index_projects_on_customer_id"
  add_index "projects", ["date_begin"], :name => "index_projects_on_date_begin"
  add_index "projects", ["date_end"], :name => "index_projects_on_date_end"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "tasks", :force => true do |t|
    t.string   "description"
    t.integer  "hours"
    t.integer  "status"
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "type_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tasks", ["project_id"], :name => "index_tasks_on_project_id"
  add_index "tasks", ["type_id"], :name => "index_tasks_on_type_id"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "types", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
