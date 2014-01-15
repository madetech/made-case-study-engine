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

ActiveRecord::Schema.define(:version => 20140115115058) do

  create_table "case_study_categories", :force => true do |t|
    t.string "name"
  end

  create_table "case_study_items", :force => true do |t|
    t.text     "description"
    t.string   "excerpt"
    t.text     "external_url"
    t.integer  "order",                      :default => 9999
    t.text     "outcomes"
    t.string   "title"
    t.string   "type"
    t.string   "url"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "feature_image_file_name"
    t.string   "feature_image_content_type"
    t.integer  "feature_image_file_size"
    t.datetime "feature_image_updated_at"
  end

  add_index "case_study_items", ["type"], :name => "index_case_study_items_on_type"
  add_index "case_study_items", ["url"], :name => "index_case_study_items_on_url", :unique => true

  create_table "case_study_media", :force => true do |t|
    t.integer  "case_study_id"
    t.integer  "order",              :default => 9999
    t.text     "video_embed"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "case_study_media", ["case_study_id"], :name => "index_case_study_media_on_case_study_id"

  create_table "case_study_tags", :force => true do |t|
    t.string "name"
  end

  create_table "case_study_taxonomies", :force => true do |t|
    t.integer "case_study_id"
    t.integer "taxonomable_id"
    t.string  "taxonomable_type"
    t.integer "order",            :default => 9999
  end

end
