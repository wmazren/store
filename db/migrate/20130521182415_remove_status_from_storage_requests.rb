class RemoveStatusFromStorageRequests < ActiveRecord::Migration
  def up
    remove_column :storage_requests, :status
  end

  def down
    add_column :storage_requests, :status, :string
  end
end
