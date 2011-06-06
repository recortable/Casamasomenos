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

ActiveRecord::Schema.define(:version => 20110505135504) do

  create_table "articles", :force => true do |t|
    t.string   "title",      :limit => 300
    t.text     "body"
    t.string   "lang",       :limit => 6
    t.integer  "author_id"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["ancestry"], :name => "index_articles_on_ancestry"
  add_index "articles", ["author_id"], :name => "index_articles_on_author_id"

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

  create_table "users", :force => true do |t|
    t.string   "name",       :limit => 100
    t.string   "email",      :limit => 300
    t.string   "rol",        :limit => 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
