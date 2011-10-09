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

ActiveRecord::Schema.define(:version => 0) do

  create_table "groups", :force => true do |t|
    t.string "group", :limit => 45, :null => false
  end

  create_table "references", :force => true do |t|
    t.text "reference", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string "role", :limit => 24, :null => false
  end

  create_table "todo_items", :force => true do |t|
    t.string   "task_list",     :limit => 128,                  :null => false
    t.datetime "start_date",                                    :null => false
    t.datetime "end_date",                                      :null => false
    t.text     "completed",                    :default => "N"
    t.integer  "todo_tasks_id",                                 :null => false
  end

  add_index "todo_items", ["todo_tasks_id"], :name => "todo_items.fk_todo_task_lists_todo_tasks_id"

  create_table "todo_lists", :force => true do |t|
    t.string   "task",      :limit => 45
    t.datetime "due_date"
    t.text     "completed"
    t.integer  "users_id",                :null => false
  end

  add_index "todo_lists", ["id", "users_id"], :name => "sqlite_autoindex_todo_lists_1", :unique => true
  add_index "todo_lists", ["users_id"], :name => "todo_lists.fk_todo_tasks_users_id"

  create_table "users", :force => true do |t|
    t.string  "user_name", :limit => 24, :null => false
    t.string  "passwd",    :limit => 64, :null => false
    t.string  "email",     :limit => 36, :null => false
    t.integer "roles_id",                :null => false
    t.integer "groups_id",               :null => false
  end

  add_index "users", ["email"], :name => "sqlite_autoindex_users_2", :unique => true
  add_index "users", ["groups_id"], :name => "users.fk_users_groups_id"
  add_index "users", ["roles_id"], :name => "users.fk_users_roles_id"
  add_index "users", ["user_name"], :name => "sqlite_autoindex_users_1", :unique => true

end
