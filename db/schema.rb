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

ActiveRecord::Schema.define(version: 20150401182150) do

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
    t.date     "date"
  end

  create_table "activities", force: true do |t|
    t.integer  "actor_id"
    t.string   "actor_type"
    t.integer  "thing_id"
    t.string   "thing_type"
    t.integer  "school_id"
    t.text     "action"
    t.date     "feed_date"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  add_index "assets", ["attachable_id", "attachable_type"], name: "index_assets_on_attachable_id_and_attachable_type", using: :btree

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

  add_index "engagement_attendees", ["engagement_id"], name: "index_engagement_attendees_on_engagement_id", using: :btree
  add_index "engagement_attendees", ["person_id"], name: "index_engagement_attendees_on_person_id", using: :btree

  create_table "engagements", force: true do |t|
    t.date     "date"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
    t.float    "duration"
    t.text     "notes"
    t.string   "name"
    t.integer  "user_id"
    t.integer  "site_id"
    t.integer  "headcount"
  end

  add_index "engagements", ["date"], name: "index_engagements_on_date", using: :btree
  add_index "engagements", ["name"], name: "index_engagements_on_name", using: :btree
  add_index "engagements", ["school_id"], name: "index_engagements_on_school_id", using: :btree
  add_index "engagements", ["site_id"], name: "index_engagements_on_site_id", using: :btree

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

  add_index "identities", ["token"], name: "index_identities_on_token", using: :btree

  create_table "notes", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "notable_id"
    t.string   "notable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["notable_id", "notable_type"], name: "index_notes_on_notable_id_and_notable_type", using: :btree

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
    t.text     "about"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone"
    t.string   "sex"
    t.boolean  "media_consent",    default: false
    t.float    "gpa"
    t.text     "passions"
    t.integer  "site_id"
    t.integer  "user_id"
  end

  add_index "people", ["dream_team"], name: "index_people_on_dream_team", using: :btree
  add_index "people", ["first_name"], name: "index_people_on_first_name", using: :btree
  add_index "people", ["last_name"], name: "index_people_on_last_name", using: :btree
  add_index "people", ["school_id"], name: "index_people_on_school_id", using: :btree
  add_index "people", ["site_id"], name: "index_people_on_site_id", using: :btree

  create_table "project_leaders", force: true do |t|
    t.integer  "project_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_leaders", ["person_id"], name: "index_project_leaders_on_person_id", using: :btree
  add_index "project_leaders", ["project_id"], name: "index_project_leaders_on_project_id", using: :btree

  create_table "project_participants", force: true do |t|
    t.integer  "project_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_participants", ["person_id"], name: "index_project_participants_on_person_id", using: :btree
  add_index "project_participants", ["project_id"], name: "index_project_participants_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  add_index "projects", ["created_at"], name: "index_projects_on_created_at", using: :btree
  add_index "projects", ["name"], name: "index_projects_on_name", using: :btree
  add_index "projects", ["school_id"], name: "index_projects_on_school_id", using: :btree
  add_index "projects", ["status"], name: "index_projects_on_status", using: :btree
  add_index "projects", ["updated_at"], name: "index_projects_on_updated_at", using: :btree

  create_table "reflections", force: true do |t|
    t.text     "content"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reflectable_id"
    t.string   "reflectable_type"
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
    t.integer  "school_id"
    t.integer  "clearance_level", default: 1
    t.integer  "site_id"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", using: :btree
  add_index "users", ["site_id"], name: "index_users_on_site_id", using: :btree

end
