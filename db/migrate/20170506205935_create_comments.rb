class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :blog, index: true, foreign_key: true
      t.boolean :approved, default: false

      t.timestamps null: false
    end
  end
end
