class AddDetailsToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :insurance_value, :string
  end
end
