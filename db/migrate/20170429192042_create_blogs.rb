class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
        t.string :title
        t.string :teaser
        t.text :body
        t.attachment :image
        t.string :slug
        t.references :user, index: true, foreign_key: true

        t.timestamps null: false
    end
    add_index :blogs, :slug, unique: true
  end
end
