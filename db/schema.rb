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

ActiveRecord::Schema.define(version: 20170505103741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.integer  "number"
    t.text     "pt"
    t.integer  "book_id"
    t.integer  "title_id"
    t.integer  "subtitle_id"
    t.integer  "chapter_id"
    t.integer  "section_id"
    t.integer  "subsection_id"
    t.integer  "division_id"
    t.integer  "subdivision_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["book_id"], name: "index_articles_on_book_id", using: :btree
    t.index ["chapter_id"], name: "index_articles_on_chapter_id", using: :btree
    t.index ["division_id"], name: "index_articles_on_division_id", using: :btree
    t.index ["section_id"], name: "index_articles_on_section_id", using: :btree
    t.index ["subdivision_id"], name: "index_articles_on_subdivision_id", using: :btree
    t.index ["subsection_id"], name: "index_articles_on_subsection_id", using: :btree
    t.index ["subtitle_id"], name: "index_articles_on_subtitle_id", using: :btree
    t.index ["title_id"], name: "index_articles_on_title_id", using: :btree
  end

  create_table "books", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "number"
    t.integer  "title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id"], name: "index_chapters_on_title_id", using: :btree
  end

  create_table "divisions", force: :cascade do |t|
    t.string   "number"
    t.integer  "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_divisions_on_section_id", using: :btree
  end

  create_table "headings", force: :cascade do |t|
    t.text     "pt"
    t.integer  "article_id"
    t.integer  "book_id"
    t.integer  "title_id"
    t.integer  "subtitle_id"
    t.integer  "chapter_id"
    t.integer  "section_id"
    t.integer  "subsection_id"
    t.integer  "division_id"
    t.integer  "subdivision_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["article_id"], name: "index_headings_on_article_id", using: :btree
    t.index ["book_id"], name: "index_headings_on_book_id", using: :btree
    t.index ["chapter_id"], name: "index_headings_on_chapter_id", using: :btree
    t.index ["division_id"], name: "index_headings_on_division_id", using: :btree
    t.index ["section_id"], name: "index_headings_on_section_id", using: :btree
    t.index ["subdivision_id"], name: "index_headings_on_subdivision_id", using: :btree
    t.index ["subsection_id"], name: "index_headings_on_subsection_id", using: :btree
    t.index ["subtitle_id"], name: "index_headings_on_subtitle_id", using: :btree
    t.index ["title_id"], name: "index_headings_on_title_id", using: :btree
  end

  create_table "sections", force: :cascade do |t|
    t.string   "number"
    t.integer  "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_sections_on_chapter_id", using: :btree
  end

  create_table "subdivisions", force: :cascade do |t|
    t.string   "number"
    t.integer  "division_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["division_id"], name: "index_subdivisions_on_division_id", using: :btree
  end

  create_table "subsections", force: :cascade do |t|
    t.string   "number"
    t.integer  "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_subsections_on_section_id", using: :btree
  end

  create_table "subtitles", force: :cascade do |t|
    t.string   "number"
    t.integer  "title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id"], name: "index_subtitles_on_title_id", using: :btree
  end

  create_table "titles", force: :cascade do |t|
    t.string   "number"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_titles_on_book_id", using: :btree
  end

  create_table "translations", force: :cascade do |t|
    t.text     "en"
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "heading_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_translations_on_article_id", using: :btree
    t.index ["heading_id"], name: "index_translations_on_heading_id", using: :btree
    t.index ["user_id"], name: "index_translations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "articles", "books"
  add_foreign_key "articles", "chapters"
  add_foreign_key "articles", "divisions"
  add_foreign_key "articles", "sections"
  add_foreign_key "articles", "subdivisions"
  add_foreign_key "articles", "subsections"
  add_foreign_key "articles", "subtitles"
  add_foreign_key "articles", "titles"
  add_foreign_key "chapters", "titles"
  add_foreign_key "divisions", "sections"
  add_foreign_key "headings", "articles"
  add_foreign_key "headings", "books"
  add_foreign_key "headings", "chapters"
  add_foreign_key "headings", "divisions"
  add_foreign_key "headings", "sections"
  add_foreign_key "headings", "subdivisions"
  add_foreign_key "headings", "subsections"
  add_foreign_key "headings", "subtitles"
  add_foreign_key "headings", "titles"
  add_foreign_key "sections", "chapters"
  add_foreign_key "subdivisions", "divisions"
  add_foreign_key "subsections", "sections"
  add_foreign_key "subtitles", "titles"
  add_foreign_key "titles", "books"
  add_foreign_key "translations", "articles"
  add_foreign_key "translations", "headings"
  add_foreign_key "translations", "users"
end
