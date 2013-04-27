class AddStorageRequestIdToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :storage_request_id, :integer
  end
end
