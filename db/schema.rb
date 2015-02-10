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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150128232439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "environmental_analyses", force: :cascade do |t|
    t.integer  "user_id",                                                         null: false
    t.date     "year_and_month",                           default: '2015-02-09'
    t.decimal  "grade",            precision: 3, scale: 1, default: 0.0
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.integer  "type_of_analysis",                         default: 2
  end

  create_table "factors", force: :cascade do |t|
    t.integer  "environmental_analysis_id",                                       null: false
    t.string   "name",                                                            null: false
    t.text     "description"
    t.integer  "importance",                                        default: 5,   null: false
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.decimal  "grade",                     precision: 3, scale: 1, default: 1.0
  end

  create_table "sub_factors", force: :cascade do |t|
    t.integer  "factor_id",                                         null: false
    t.string   "name",                                              null: false
    t.text     "description"
    t.integer  "importance",                          default: 1,   null: false
    t.integer  "situation",                           default: 1,   null: false
    t.decimal  "grade",       precision: 3, scale: 1, default: 1.0, null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                                null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
