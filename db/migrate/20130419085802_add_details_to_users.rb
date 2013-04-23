class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :business_unit, :string
    add_column :users, :role, :string
    add_column :users, :active, :boolean, :null => false, :default => true
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :town, :string
    add_column :users, :postcode, :string
    add_column :users, :state, :string
  end
end
