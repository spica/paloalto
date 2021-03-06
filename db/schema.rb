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

ActiveRecord::Schema.define(version: 20140410050130) do

  create_table "answers", force: true do |t|
    t.string   "company_name"
    t.string   "manager_name"
    t.string   "department"
    t.string   "work_level"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "email"
    t.integer  "answer_1"
    t.integer  "answer_2"
    t.integer  "answer_3"
    t.integer  "answer_4"
    t.integer  "answer_5"
    t.integer  "answer_6"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
