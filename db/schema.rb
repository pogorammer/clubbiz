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

ActiveRecord::Schema.define(version: 20140526003610) do

  create_table "announcements", force: true do |t|
    t.string   "content"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "announcements", ["club_id"], name: "index_announcements_on_club_id"

  create_table "bearers", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "position"
    t.boolean  "is_administrator"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "club_id"
  end

  add_index "bearers", ["club_id"], name: "index_bearers_on_club_id"

  create_table "club_events", force: true do |t|
    t.integer  "club_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "club_events", ["club_id", "event_id"], name: "index_club_events_on_club_id_and_event_id", unique: true
  add_index "club_events", ["club_id"], name: "index_club_events_on_club_id"
  add_index "club_events", ["event_id"], name: "index_club_events_on_event_id"

  create_table "club_posts", force: true do |t|
    t.string   "post"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "club_posts", ["club_id"], name: "index_club_posts_on_club_id"

  create_table "clubs", force: true do |t|
    t.string   "club_name"
    t.string   "club_number"
    t.string   "url"
    t.string   "club_login"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "club_valid",      default: false
    t.string   "avatar"
    t.string   "announcement"
  end

  add_index "clubs", ["club_name"], name: "index_clubs_on_club_name", unique: true

  create_table "events", force: true do |t|
    t.string   "title"
    t.datetime "datetime"
    t.string   "img1"
    t.string   "img2"
    t.string   "img3"
    t.string   "url"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.string   "post"
    t.integer  "student_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_tickets", force: true do |t|
    t.integer  "student_id"
    t.integer  "ticket_id"
    t.integer  "event_id"
    t.integer  "amount"
    t.decimal  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_tickets", ["event_id"], name: "index_student_tickets_on_event_id"
  add_index "student_tickets", ["student_id"], name: "index_student_tickets_on_student_id"
  add_index "student_tickets", ["ticket_id"], name: "index_student_tickets_on_ticket_id"

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "avatar"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true
  add_index "students", ["remember_token"], name: "index_students_on_remember_token"

  create_table "tickets", force: true do |t|
    t.string   "ticket_type"
    t.decimal  "ticket_price"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
  end

  add_index "tickets", ["event_id"], name: "index_tickets_on_event_id"

end
