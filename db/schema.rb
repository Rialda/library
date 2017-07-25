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

ActiveRecord::Schema.define(version: 20170725090221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.string   "bootsy_resource_type"
    t.integer  "bootsy_resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_lines", force: :cascade do |t|
    t.integer  "line_no"
    t.decimal  "single_price"
    t.integer  "item_id"
    t.integer  "cart_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["cart_id"], name: "index_cart_lines_on_cart_id", using: :btree
    t.index ["item_id"], name: "index_cart_lines_on_item_id", using: :btree
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "line_no"
    t.decimal  "total"
    t.decimal  "shipping"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.text     "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "fullname"
  end

  create_table "items", force: :cascade do |t|
    t.text     "item_name"
    t.text     "author"
    t.text     "edition"
    t.integer  "year_published"
    t.text     "publisher"
    t.bigint   "isbn"
    t.integer  "on_stack"
    t.decimal  "price"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.integer  "tag_id"
    t.integer  "language_id"
    t.boolean  "borrow"
    t.boolean  "buy"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "on_stack_buy"
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["language_id"], name: "index_items_on_language_id", using: :btree
    t.index ["subcategory_id"], name: "index_items_on_subcategory_id", using: :btree
    t.index ["tag_id"], name: "index_items_on_tag_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.text     "language_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "news", force: :cascade do |t|
    t.text     "title"
    t.text     "author"
    t.text     "news_body"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
  end

  create_table "shelves", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.boolean  "reserved"
    t.boolean  "borrowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_shelves_on_item_id", using: :btree
    t.index ["user_id"], name: "index_shelves_on_user_id", using: :btree
  end

  create_table "subcategories", force: :cascade do |t|
    t.text     "subcategory_name"
    t.integer  "category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.text     "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "isguest",                default: true
    t.boolean  "ismember",               default: false
    t.boolean  "isadmin",                default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "cart_lines", "carts"
  add_foreign_key "cart_lines", "items"
  add_foreign_key "carts", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "languages"
  add_foreign_key "items", "subcategories"
  add_foreign_key "items", "tags"
  add_foreign_key "shelves", "items"
  add_foreign_key "shelves", "users"
  add_foreign_key "subcategories", "categories"
end
