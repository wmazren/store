class CreateBoxRequests < ActiveRecord::Migration
  def change
    create_table :box_requests do |t|
      t.integer :quantity
      t.integer :user_id
      t.string :state

      t.timestamps
    end

    add_index :box_requests, :user_id
  end
end
