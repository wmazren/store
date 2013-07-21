class CreateRetrievalRequests < ActiveRecord::Migration
  def change
    create_table :retrieval_requests do |t|
      t.integer :package_id
      t.string :state
      t.integer :user_id

      t.timestamps
    end

    add_index :retrieval_requests, :package_id
    add_index :retrieval_requests, :user_id
  end
end
