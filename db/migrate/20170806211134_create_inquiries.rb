class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :email
      t.boolean  "analytics",       default: false
      t.boolean  "seo",             default: false
      t.boolean  "social_media",    default: false
      t.boolean  "logo_design",     default: false
      t.boolean  "graphic_design",  default: false
      t.boolean  "print_materials", default: false
      t.boolean  "copywriting",     default: false
      t.boolean  "site_design",     default: false
      t.boolean  "development",     default: false
      t.text     "other"
      t.string   "project_name"
      t.integer  "user_id"

      t.timestamps null: false
    end
    add_index "inquiries", ["user_id"], name: "index_inquiries_on_user_id"

  end
end
