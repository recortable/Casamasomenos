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

ActiveRecord::Schema.define(:version => 20111109221417) do

  create_table "articles", :force => true do |t|
    t.string   "title",                  :limit => 300
    t.text     "body"
    t.string   "lang",                   :limit => 6
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "ancestry",               :limit => 300
    t.integer  "ancestry_depth",                        :default => 0
    t.integer  "position"
    t.string   "state",                  :limit => 16
    t.boolean  "always_visible_on_tree",                :default => false
    t.string   "languages",              :limit => 30
    t.string   "content_type",           :limit => 16
  end

  add_index "articles", ["ancestry"], :name => "index_articles_on_ancestry"
  add_index "articles", ["author_id"], :name => "index_articles_on_author_id"

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 32
    t.string   "es_name",    :limit => 64
    t.string   "en_name",    :limit => 64
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "author_id"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["ancestry"], :name => "index_comments_on_ancestry"
  add_index "comments", ["author_id"], :name => "index_comments_on_author_id"
  add_index "comments", ["resource_id"], :name => "index_comments_on_resource_id"
  add_index "comments", ["resource_type"], :name => "index_comments_on_resource_type"

  create_table "mediafiles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "title",         :limit => 300
    t.string   "description",   :limit => 512
    t.string   "file",          :limit => 300
    t.string   "code",          :limit => 1024
    t.string   "media_type",    :limit => 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mediafiles", ["resource_id"], :name => "index_mediafiles_on_resource_id"
  add_index "mediafiles", ["resource_type"], :name => "index_mediafiles_on_resource_type"
  add_index "mediafiles", ["user_id"], :name => "index_mediafiles_on_user_id"

  create_table "relations", :force => true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "user_id"
    t.string   "category",         :limit => 16
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "from_category_id"
    t.integer  "to_category_id"
  end

  add_index "relations", ["from_id"], :name => "index_relations_on_from_id"
  add_index "relations", ["to_id"], :name => "index_relations_on_to_id"
  add_index "relations", ["user_id"], :name => "index_relations_on_user_id"

  create_table "translations", :force => true do |t|
    t.integer  "author_id"
    t.integer  "article_id"
    t.string   "title",      :limit => 300
    t.text     "body"
    t.string   "lang",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",            :limit => 100
    t.string   "email",           :limit => 300
    t.string   "rol",             :limit => 16
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
