class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :box_id
      t.integer :box_request_id
      t.string :state

      t.timestamps
    end

    add_index :stocks, :box_id
    add_index :stocks, :box_request_id
  end
end
