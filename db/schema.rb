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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141006151801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: true do |t|
    t.integer  "subject_id"
    t.string   "subject_type"
    t.text     "what"
    t.boolean  "interesting"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "who"
    t.integer  "school_id"
    t.integer  "actor_id"
    t.string   "actor_type"
    t.date     "day"
  end

  create_table "assets", force: true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "external_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.boolean  "public",            default: true
    t.text     "caption"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "engagement_attendees", force: true do |t|
    t.integer  "engagement_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "engagements", force: true do |t|
    t.date     "date"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
    t.float    "duration"
    t.text     "notes"
  end

  create_table "go_redirects", force: true do |t|
    t.string   "shortcut"
    t.string   "url"
    t.integer  "hit_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "go_redirects", ["shortcut"], name: "index_go_redirects_on_shortcut", using: :btree

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "token_expires_at"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "one_on_ones", force: true do |t|
    t.integer  "school_id"
    t.integer  "person_id"
    t.date     "date"
    t.float    "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
  end

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",             default: "student"
    t.integer  "school_id"
    t.integer  "grade"
    t.boolean  "dream_team",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "engagement_score"
    t.text     "notes"
    t.string   "auth_token"
    t.text     "about"
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "project_leaders", force: true do |t|
    t.integer  "project_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_participants", force: true do |t|
    t.integer  "project_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reflections", force: true do |t|
    t.text     "content"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.text     "content"
    t.integer  "person_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "shortname"
    t.string   "address"
    t.integer  "dream_director_id"
    t.integer  "site_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.string   "name"
    t.integer  "captain_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_assignments", force: true do |t|
    t.integer  "task_id"
    t.integer  "assignee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete",    default: false
  end

  create_table "tasks", force: true do |t|
    t.string   "action"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete",   default: false
  end

  create_table "testimonials", force: true do |t|
    t.text     "content"
    t.integer  "person_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "auth_token"
    t.string   "avatar_url"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
