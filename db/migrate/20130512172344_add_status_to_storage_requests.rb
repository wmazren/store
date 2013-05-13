class AddStatusToStorageRequests < ActiveRecord::Migration
  def change
    add_column :storage_requests, :status, :string, :default => "new"
  end
end
