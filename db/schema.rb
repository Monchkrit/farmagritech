# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2025_01_27_130701) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accountings", force: :cascade do |t|
    t.integer "garden"
    t.string "job"
    t.datetime "start_time", precision: nil
    t.datetime "finish_time", precision: nil
    t.integer "farmer_id"
    t.integer "gardener_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "garden_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["garden_id"], name: "index_enrollments_on_garden_id"
    t.index ["user_id", "garden_id"], name: "index_enrollments_on_user_id_and_garden_id"
  end

  create_table "gardens", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.integer "length"
    t.integer "width"
    t.float "latitude"
    t.float "longitude"
    t.string "picture"
    t.integer "user_id"
    t.string "musym"
    t.bigint "column_order"
    t.bigint "row_order"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "gardtype"
    t.string "description"
    t.string "title"
    t.index ["column_order"], name: "index_gardens_on_column_order", unique: true
    t.index ["row_order"], name: "index_gardens_on_row_order", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.integer "garden_id"
    t.integer "user_id"
    t.datetime "start_time", precision: nil
    t.datetime "finish_time", precision: nil
    t.boolean "status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "gardener_id"
    t.integer "farmer_id"
    t.boolean "verified"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "product_type"
    t.decimal "price"
    t.datetime "market_date", precision: nil
    t.string "picture"
    t.string "zipcode"
    t.integer "user_id"
    t.integer "weight"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "telephone"
    t.integer "maxorder"
    t.boolean "verified"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.integer "soilcube_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "unitid"
    t.integer "warranty_length"
    t.decimal "fatsupportcost1yr"
    t.decimal "fatsupportcost2yr"
    t.decimal "fatsupportcost3yr"
    t.string "cpu"
    t.integer "core_count"
    t.integer "ram"
    t.string "memory_type"
    t.integer "hdgigs"
    t.string "hdtype"
    t.string "opticaldrive"
    t.string "video"
    t.string "videoint"
  end

  create_table "orders", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "zipcode"
    t.string "state"
    t.integer "orders"
    t.integer "buyer_id"
    t.integer "farmer_id"
    t.integer "listing_id"
    t.boolean "verified"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "phmuszipcodes", force: :cascade do |t|
    t.string "zipcode"
    t.string "zone"
    t.string "trange"
    t.string "zonetitle"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "planttypes", force: :cascade do |t|
    t.string "botname"
    t.string "comname"
    t.string "variety"
    t.string "growtype"
    t.string "method"
    t.string "wks_blf"
    t.string "sowdepth"
    t.string "space"
    t.string "life"
    t.string "light"
    t.string "comt1"
    t.string "comt2"
    t.integer "garden_id"
    t.integer "prism_id"
    t.integer "row_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "prisms", force: :cascade do |t|
    t.integer "row_id"
    t.integer "garden_id"
    t.integer "col_num"
    t.integer "row_num"
    t.decimal "aws025wta"
    t.integer "irrcapcl"
    t.datetime "sow_time", precision: nil
    t.datetime "irr_time", precision: nil
    t.integer "seedcount"
    t.integer "planttype_id"
    t.bigint "column_order"
    t.bigint "row_order"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["column_order"], name: "index_prisms_on_column_order", unique: true
    t.index ["row_order"], name: "index_prisms_on_row_order", unique: true
  end

  create_table "rows", force: :cascade do |t|
    t.integer "garden_id"
    t.integer "row_num"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "county"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "soilcubes", force: :cascade do |t|
    t.integer "garden_id"
    t.integer "row_id"
    t.integer "prism_id"
    t.integer "col_num"
    t.integer "row_num"
    t.string "crop_name"
    t.decimal "aws025wta"
    t.integer "irrcapcl"
    t.datetime "sow_time", precision: nil
    t.datetime "irr_time", precision: nil
    t.integer "seedcount"
    t.integer "planttype_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "cult_date", precision: nil
    t.datetime "feed_date", precision: nil
    t.string "feed_type"
    t.datetime "weed_date", precision: nil
    t.datetime "harvest_date", precision: nil
    t.string "harvest_type"
  end

  create_table "soils", force: :cascade do |t|
    t.decimal "om_r"
    t.integer "awc_r"
    t.integer "wsatiated_r"
    t.decimal "kwfact"
    t.integer "ph1to1h2o_r"
    t.string "compname"
    t.integer "slope_r"
    t.string "runoff"
    t.integer "tfact"
    t.string "elev_r"
    t.string "geomdesc"
    t.integer "ffd_r"
    t.integer "nirrcapcl"
    t.string "nirrcapscl"
    t.integer "irrcapcl"
    t.string "irrcapscl"
    t.integer "mukey"
    t.string "musym"
    t.string "muname"
    t.string "drainagecl"
    t.decimal "aws025wta"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
