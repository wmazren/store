class AddStatusToRetrievalRequests < ActiveRecord::Migration
  def change
    add_column :retrieval_requests, :status, :string
  end
end
