class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :opt_in, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
  end
end
