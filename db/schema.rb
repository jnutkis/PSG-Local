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

ActiveRecord::Schema.define(version: 20170219181738) do

  create_table "associations", force: :cascade do |t|
    t.integer "reference_id"
    t.integer "product_id"
    t.index ["product_id"], name: "index_associations_on_product_id"
    t.index ["reference_id"], name: "index_associations_on_reference_id"
  end

  create_table "products", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.string  "url"
    t.integer "vendor_id"
    t.index ["vendor_id"], name: "index_products_on_vendor_id"
  end

  create_table "references", force: :cascade do |t|
    t.string   "full_ref"
    t.string   "short_ref"
    t.text     "specification"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "vendor_id"
    t.integer  "admin"
    t.integer  "superuser"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "active",            default: 0, null: false
    t.integer  "newpw",             default: 1, null: false
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.datetime "activated_at"
    t.string   "otp_secret_key"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "password_fails",    default: 0
    t.datetime "locked_at"
    t.index ["vendor_id"], name: "index_users_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string  "name"
    t.string  "website"
    t.string  "logo"
    t.string  "email"
    t.integer "active"
    t.string  "phone"
  end

end
