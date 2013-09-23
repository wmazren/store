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

ActiveRecord::Schema.define(:version => 20130923152137) do

  create_table "bays", :force => true do |t|
    t.string   "name"
    t.integer  "num_of_levels"
    t.integer  "num_of_slots_per_level"
    t.integer  "floor_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "bays", ["floor_id"], :name => "index_bays_on_floor_id"

  create_table "floors", :force => true do |t|
    t.string   "name"
    t.integer  "warehouse_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "floors", ["warehouse_id"], :name => "index_floors_on_warehouse_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "package_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "item_date"
    t.string   "item_type"
  end

  add_index "items", ["package_id"], :name => "index_items_on_package_id"
  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "levels", :force => true do |t|
    t.string   "name"
    t.integer  "num_of_slots_per_level"
    t.integer  "bay_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "levels", ["bay_id"], :name => "index_levels_on_bay_id"

  create_table "packages", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.string   "barcode"
    t.integer  "storage_request_id"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "packages", ["storage_request_id"], :name => "index_packages_on_storage_request_id"
  add_index "packages", ["user_id"], :name => "index_packages_on_user_id"

  create_table "retrieval_requests", :force => true do |t|
    t.integer  "package_id"
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "retrieval_requests", ["package_id"], :name => "index_retrieval_requests_on_package_id"
  add_index "retrieval_requests", ["user_id"], :name => "index_retrieval_requests_on_user_id"

  create_table "slots", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.integer  "warehouse_id"
    t.integer  "level_id"
    t.integer  "package_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "slots", ["level_id"], :name => "index_slots_on_level_id"
  add_index "slots", ["package_id"], :name => "index_slots_on_package_id"
  add_index "slots", ["warehouse_id"], :name => "index_slots_on_warehouse_id"

  create_table "storage_requests", :force => true do |t|
    t.integer  "user_id"
    t.string   "submit_state"
    t.string   "state"
    t.integer  "warehouse_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "storage_requests", ["user_id"], :name => "index_storage_requests_on_user_id"
  add_index "storage_requests", ["warehouse_id"], :name => "index_storage_requests_on_warehouse_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.boolean  "active",                 :default => true, :null => false
    t.string   "full_name"
    t.string   "role"
    t.string   "position"
    t.string   "business_unit"
    t.string   "address1"
    t.string   "address2"
    t.string   "town"
    t.string   "postcode"
    t.string   "state"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "phone3"
    t.string   "fax"
    t.string   "mobile"
    t.string   "user_type"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

  create_table "warehouses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
