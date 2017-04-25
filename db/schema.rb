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

ActiveRecord::Schema.define(version: 20170414180353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "a_passives", force: :cascade do |t|
  end

  create_table "assists", force: :cascade do |t|
  end

  create_table "b_passives", force: :cascade do |t|
    t.string "effect"
    t.string "effect_value"
  end

  create_table "c_passives", force: :cascade do |t|
  end

  create_table "hero_skills", force: :cascade do |t|
    t.integer "hero_id"
    t.integer "skill_id"
    t.integer "rarity"
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.string "colour"
    t.string "weapon_type"
    t.string "move_type"
  end

  create_table "skills", force: :cascade do |t|
    t.string  "type"
    t.string  "name"
    t.integer "required_skill_id"
    t.text    "description"
    t.string  "inherit_rule"
    t.integer "sp_cost"
    t.string  "actable_type"
    t.integer "actable_id"
    t.index ["actable_type", "actable_id"], name: "index_skills_on_actable_type_and_actable_id", using: :btree
    t.index ["sp_cost"], name: "index_skills_on_sp_cost", using: :btree
  end

  create_table "specials", force: :cascade do |t|
    t.integer "cooldown"
  end

  create_table "weapons", force: :cascade do |t|
    t.string  "weapon_type"
    t.integer "might"
    t.integer "range"
    t.string  "colour"
  end

end