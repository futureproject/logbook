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

ActiveRecord::Schema.define(version: 20151215185259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "assets", force: :cascade do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type",   limit: 255
    t.string   "external_url",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_name",    limit: 255
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.boolean  "public",                        default: true
    t.text     "caption"
  end

  add_index "assets", ["attachable_id", "attachable_type"], name: "index_assets_on_attachable_id_and_attachable_type", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",               default: 0, null: false
    t.integer  "attempts",               default: 0, null: false
    t.text     "handler",                            null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "engagement_attendees", force: :cascade do |t|
    t.integer  "engagement_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "engagement_attendees", ["engagement_id"], name: "index_engagement_attendees_on_engagement_id", using: :btree
  add_index "engagement_attendees", ["person_id"], name: "index_engagement_attendees_on_person_id", using: :btree

  create_table "engagements", force: :cascade do |t|
    t.date     "date"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind",        limit: 255
    t.float    "duration"
    t.text     "description"
    t.citext   "name"
    t.integer  "creator_id"
    t.integer  "site_id"
    t.integer  "headcount"
    t.integer  "notes_count",             default: 0
  end

  add_index "engagements", ["date"], name: "index_engagements_on_date", using: :btree
  add_index "engagements", ["name"], name: "index_engagements_on_name", using: :btree
  add_index "engagements", ["school_id"], name: "index_engagements_on_school_id", using: :btree
  add_index "engagements", ["site_id"], name: "index_engagements_on_site_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "token",            limit: 255
    t.string   "token_expires_at", limit: 255
    t.string   "url",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
    t.string   "email",            limit: 255
    t.string   "password_digest",  limit: 255
  end

  add_index "identities", ["token"], name: "index_identities_on_token", using: :btree

  create_table "notes", force: :cascade do |t|
    t.text     "content"
    t.integer  "author_id"
    t.integer  "notable_id"
    t.string   "notable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["notable_id", "notable_type"], name: "index_notes_on_notable_id_and_notable_type", using: :btree

  create_table "people", force: :cascade do |t|
    t.citext   "first_name"
    t.citext   "last_name"
    t.string   "role",                       limit: 255, default: "student"
    t.integer  "school_id"
    t.integer  "grade"
    t.boolean  "dream_team",                             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                      limit: 255
    t.string   "phone",                      limit: 255
    t.string   "sex",                        limit: 255
    t.integer  "site_id"
    t.integer  "creator_id"
    t.integer  "graduated_in"
    t.string   "auth_token"
    t.string   "avatar_url"
    t.text     "description"
    t.date     "last_engaged"
    t.string   "osis"
    t.boolean  "active",                                 default: true
    t.date     "first_engaged"
    t.integer  "project_people_count",                   default: 0
    t.integer  "engagement_attendees_count",             default: 0
    t.integer  "notes_count",                            default: 0
    t.integer  "clearance_level",                        default: 1
    t.boolean  "future_fellow",                          default: false
    t.boolean  "ob_media_release",                       default: false
    t.boolean  "ob_parental_consent",                    default: false
    t.boolean  "ob_disclaimer",                          default: false
    t.date     "birthday"
    t.string   "instagram_handle"
    t.string   "twitter_handle"
    t.string   "facebook_handle"
    t.string   "parent_first_name"
    t.string   "parent_last_name"
    t.string   "parent_phone"
    t.string   "parent_email"
  end

  add_index "people", ["active"], name: "index_people_on_active", using: :btree
  add_index "people", ["dream_team"], name: "index_people_on_dream_team", using: :btree
  add_index "people", ["first_engaged"], name: "index_people_on_first_engaged", using: :btree
  add_index "people", ["first_name"], name: "index_people_on_first_name", using: :btree
  add_index "people", ["graduated_in"], name: "index_people_on_graduated_in", using: :btree
  add_index "people", ["last_engaged"], name: "index_people_on_last_engaged", using: :btree
  add_index "people", ["last_name"], name: "index_people_on_last_name", using: :btree
  add_index "people", ["school_id"], name: "index_people_on_school_id", using: :btree
  add_index "people", ["site_id"], name: "index_people_on_site_id", using: :btree

  create_table "project_engagement_links", force: :cascade do |t|
    t.integer  "engagement_id"
    t.integer  "project_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "project_leaders", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_leaders", ["person_id"], name: "index_project_leaders_on_person_id", using: :btree
  add_index "project_leaders", ["project_id"], name: "index_project_leaders_on_project_id", using: :btree

  create_table "project_participants", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_participants", ["person_id"], name: "index_project_participants_on_person_id", using: :btree
  add_index "project_participants", ["project_id"], name: "index_project_participants_on_project_id", using: :btree

  create_table "project_people", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "person_id"
    t.boolean  "leading",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.citext   "name"
    t.integer  "school_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",               limit: 255
    t.integer  "notes_count",                      default: 0
    t.integer  "project_people_count",             default: 0
  end

  add_index "projects", ["created_at"], name: "index_projects_on_created_at", using: :btree
  add_index "projects", ["name"], name: "index_projects_on_name", using: :btree
  add_index "projects", ["school_id"], name: "index_projects_on_school_id", using: :btree
  add_index "projects", ["status"], name: "index_projects_on_status", using: :btree
  add_index "projects", ["updated_at"], name: "index_projects_on_updated_at", using: :btree

  create_table "report_assignments", force: :cascade do |t|
    t.integer  "report_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "report_submissions", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "body"
    t.integer  "report_id"
    t.integer  "person_id"
    t.string   "status",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_submitted"
  end

  create_table "reports", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "shortname",         limit: 255
    t.string   "address",           limit: 255
    t.integer  "dream_director_id"
    t.integer  "site_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "enrollment",                    default: 607
    t.boolean  "active",                        default: true
  end

  add_index "schools", ["active"], name: "index_schools_on_active", using: :btree

  create_table "simple_hashtag_hashtaggings", force: :cascade do |t|
    t.integer "hashtag_id"
    t.integer "hashtaggable_id"
    t.string  "hashtaggable_type"
  end

  add_index "simple_hashtag_hashtaggings", ["hashtag_id"], name: "index_simple_hashtag_hashtaggings_on_hashtag_id", using: :btree
  add_index "simple_hashtag_hashtaggings", ["hashtaggable_id", "hashtaggable_type"], name: "index_hashtaggings_hashtaggable_id_hashtaggable_type", using: :btree

  create_table "simple_hashtag_hashtags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_hashtag_hashtags", ["name"], name: "index_simple_hashtag_hashtags_on_name", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "captain_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shortname",  limit: 255
  end

end
