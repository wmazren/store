class AddStatusToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :state, :string
  end
end
