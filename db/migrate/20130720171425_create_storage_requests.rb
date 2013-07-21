class CreateStorageRequests < ActiveRecord::Migration
  def change
    create_table :storage_requests do |t|
      t.integer :user_id
      t.string :submit_state
      t.string :state
      t.integer :warehouse_id

      t.timestamps
    end

    add_index :storage_requests, :user_id
    add_index :storage_requests, :warehouse_id
  end
end
