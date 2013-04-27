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

ActiveRecord::Schema.define(:version => 20130327173643) do

  create_table "passes", :force => true do |t|
    t.string   "passTypeIdentifier"
    t.string   "authenticationToken"
    t.string   "organizationName"
    t.string   "description"
    t.string   "logoText"
    t.string   "foregroundColor"
    t.string   "backgroundColor"
    t.string   "message"
    t.string   "label"
    t.string   "value"
    t.datetime "expdate"
    t.string   "logo2x_file_name"
    t.string   "logo2x_content_type"
    t.integer  "logo2x_file_size"
    t.datetime "logo2x_updated_at"
    t.string   "apass_file_name"
    t.string   "apass_content_type"
    t.integer  "apass_file_size"
    t.datetime "apass_updated_at"
  end

end
