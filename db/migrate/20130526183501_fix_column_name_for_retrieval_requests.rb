class FixColumnNameForRetrievalRequests < ActiveRecord::Migration
  def change
    rename_column(:retrieval_requests, :status, :state)
  end
end
