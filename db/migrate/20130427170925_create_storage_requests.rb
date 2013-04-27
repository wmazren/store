class CreateStorageRequests < ActiveRecord::Migration
  def change
    create_table :storage_requests do |t|
      t.integer :user_id
      t.date :due_date

      t.timestamps
    end
  end
end
