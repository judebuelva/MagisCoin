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

ActiveRecord::Schema.define(version: 2020_05_02_113332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buy_loads", force: :cascade do |t|
    t.integer "send_id"
    t.integer "recv_id"
    t.float "amount"
    t.datetime "date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.integer "user_id"
    t.string "card_name"
    t.date "expiry_date"
    t.integer "activation_stat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "send_id"
    t.integer "recv_id"
    t.string "purchase_type"
    t.float "amount"
    t.datetime "date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qrs", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uniq_id"
  end

  create_table "receive_loads", force: :cascade do |t|
    t.integer "send_id"
    t.integer "recv_id"
    t.float "amount"
    t.datetime "date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.string "merchant_name"
    t.string "reward_name"
    t.float "reward_value"
    t.date "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "send_id"
    t.integer "recv_id"
    t.integer "card_id"
    t.string "purchase_type"
    t.float "amount"
    t.datetime "time_recorded"
    t.integer "ReferenceNo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "f_name"
    t.string "l_name"
    t.date "birthday"
    t.string "role"
    t.string "merchant_name"
    t.string "owner_fname"
    t.string "owner_lname"
    t.string "email"
    t.bigint "contact_num"
    t.string "address"
    t.float "balance"
    t.string "user_type"
    t.string "password_digest"
    t.string "question_1"
    t.string "question_2"
    t.string "question_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
