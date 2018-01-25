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

ActiveRecord::Schema.define(version: 20180123143904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "market_coin_streams", force: :cascade do |t|
    t.datetime "last_broadcast_at"
    t.bigint "market_coin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["market_coin_id"], name: "index_market_coin_streams_on_market_coin_id"
  end

  create_table "market_coin_streams_users", id: false, force: :cascade do |t|
    t.bigint "market_coin_stream_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["market_coin_stream_id"], name: "index_market_coin_streams_users_on_market_coin_stream_id"
    t.index ["user_id"], name: "index_market_coin_streams_users_on_user_id"
  end

  create_table "market_coins", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.string "coin_name"
    t.string "full_name"
    t.string "logo_url"
    t.string "algorithm"
    t.string "proof_type"
    t.float "market_cap"
    t.float "price"
    t.float "day_open"
    t.float "day_high"
    t.float "day_low"
    t.float "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["symbol"], name: "index_market_coins_on_symbol", unique: true
  end

  create_table "portfolio_coins", force: :cascade do |t|
    t.float "quantity"
    t.bigint "user_portfolio_id"
    t.bigint "market_coin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["market_coin_id"], name: "index_portfolio_coins_on_market_coin_id"
    t.index ["user_portfolio_id"], name: "index_portfolio_coins_on_user_portfolio_id"
  end

  create_table "user_market_coins", force: :cascade do |t|
    t.datetime "favorited_at"
    t.bigint "user_id"
    t.bigint "market_coin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["market_coin_id"], name: "index_user_market_coins_on_market_coin_id"
    t.index ["user_id"], name: "index_user_market_coins_on_user_id"
  end

  create_table "user_portfolios", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_portfolios_on_user_id"
  end

  create_table "user_settings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "primary_market_coin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["primary_market_coin_id"], name: "index_user_settings_on_primary_market_coin_id"
    t.index ["user_id"], name: "index_user_settings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "token"
    t.string "role"
    t.string "email"
    t.string "encrypted_password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "portfolio_coins", "market_coins", on_delete: :cascade
  add_foreign_key "portfolio_coins", "user_portfolios", on_delete: :cascade
  add_foreign_key "user_portfolios", "users", on_delete: :cascade
  add_foreign_key "user_settings", "users", on_delete: :cascade
end
