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

ActiveRecord::Schema.define(version: 20140730103122) do

  create_table "futurejobs", force: true do |t|
    t.string   "title"
    t.string   "desc"
    t.string   "name"
    t.string   "validdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobregistrations", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "housenumber"
    t.string   "street"
    t.string   "village"
    t.string   "district"
    t.string   "state"
    t.string   "phone"
    t.string   "email"
    t.string   "experience"
    t.string   "qualification"
    t.string   "school1"
    t.string   "school2"
    t.string   "school3"
    t.string   "school4"
    t.string   "passout1"
    t.string   "passout2"
    t.string   "passout3"
    t.string   "passout4"
    t.string   "standard1"
    t.string   "standard2"
    t.string   "standard3"
    t.string   "standard4"
    t.string   "job1"
    t.string   "job2"
    t.string   "job3"
    t.string   "exp1"
    t.string   "exp2"
    t.string   "exp3"
    t.text     "desc"
    t.string   "languages"
    t.string   "choicelocation"
    t.string   "previoussalary"
    t.string   "expectedsalary"
    t.string   "religion"
    t.string   "caste"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment"
    t.string   "hiddenid"
  end

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.string   "desc"
    t.string   "name"
    t.string   "validdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "trainingregistrations", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "housenumber"
    t.string   "street"
    t.string   "village"
    t.string   "district"
    t.string   "state"
    t.string   "phone"
    t.string   "email"
    t.string   "experience"
    t.string   "qualification"
    t.string   "school1"
    t.string   "school2"
    t.string   "school3"
    t.string   "school4"
    t.string   "passout1"
    t.string   "passout2"
    t.string   "passout3"
    t.string   "passout4"
    t.string   "standard1"
    t.string   "standard2"
    t.string   "standard3"
    t.string   "standard4"
    t.string   "job1"
    t.string   "job2"
    t.string   "job3"
    t.string   "exp1"
    t.string   "exp2"
    t.string   "exp3"
    t.text     "desc"
    t.string   "languages"
    t.string   "choicelocation"
    t.string   "previoussalary"
    t.string   "expectedsalary"
    t.string   "religion"
    t.string   "caste"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hiddenid"
    t.string   "attachment"
  end

  create_table "trainings", force: true do |t|
    t.string   "title"
    t.string   "desc"
    t.string   "name"
    t.string   "validdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userjobs", force: true do |t|
    t.integer  "user_id"
    t.integer  "jobregistration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone"
    t.text     "address"
    t.string   "state"
    t.string   "dist"
    t.string   "citytown"
    t.string   "mandal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "Date"
    t.string   "remember_token"
    t.string   "birth"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "usertrainings", force: true do |t|
    t.integer  "user_id"
    t.integer  "trainingregistration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
