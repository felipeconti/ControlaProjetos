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

ActiveRecord::Schema.define(:version => 20130616160154) do

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "address"
    t.string   "complement"
    t.string   "neighborhood"
    t.integer  "zip_code"
    t.integer  "phone",             :limit => 5
    t.integer  "mobile",            :limit => 5
    t.integer  "fax",               :limit => 5
    t.integer  "enrollment",        :limit => 8
    t.string   "email"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "website"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "title"
    t.float    "hour_estimated"
    t.float    "hour_used"
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "description"
    t.integer  "state_id"
  end

  add_index "items", ["task_id"], :name => "index_items_on_task_id"
  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "meeting_items", :force => true do |t|
    t.integer  "customer_id"
    t.string   "subject"
    t.text     "decision"
    t.integer  "meeting_id"
    t.integer  "user_id"
    t.integer  "state_id"
    t.date     "date_state"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "meeting_items", ["customer_id"], :name => "index_meeting_items_on_customer_id"
  add_index "meeting_items", ["meeting_id"], :name => "index_meeting_items_on_meeting_id"
  add_index "meeting_items", ["state_id"], :name => "index_meeting_items_on_state_id"
  add_index "meeting_items", ["user_id"], :name => "index_meeting_items_on_user_id"

  create_table "meetings", :force => true do |t|
    t.string   "title"
    t.datetime "date_init"
    t.datetime "date_end"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "customer_id"
    t.date     "date_begin"
    t.date     "date_end"
    t.text     "specification"
    t.text     "documentation"
  end

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

  create_table "states", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.integer  "project_id"
    t.integer  "type_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "state_id"
    t.text     "description"
    t.integer  "owner_id"
    t.integer  "priority"
  end

  add_index "tasks", ["owner_id"], :name => "index_tasks_on_owner_id"
  add_index "tasks", ["project_id"], :name => "index_tasks_on_project_id"
  add_index "tasks", ["type_id"], :name => "index_tasks_on_type_id"

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
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
