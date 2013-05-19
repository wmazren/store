class AddPackageIdToRetrievalRequests < ActiveRecord::Migration
  def change
    add_column :retrieval_requests, :package_id, :integer
  end
end
