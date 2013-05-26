class FixColumnNameForStorageRequests < ActiveRecord::Migration
  def change
    rename_column(:storage_requests, :status, :state)
  end
end
