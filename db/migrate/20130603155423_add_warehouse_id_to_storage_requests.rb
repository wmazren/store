class AddWarehouseIdToStorageRequests < ActiveRecord::Migration
  def change
    add_column :storage_requests, :warehouse_id, :integer
  end
end
