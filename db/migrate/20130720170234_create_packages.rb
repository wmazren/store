class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.string :state
      t.string :barcode
      t.integer :storage_request_id
      t.integer :user_id

      t.timestamps
    end

    add_index :packages, :storage_request_id
    add_index :packages, :user_id
  end
end
