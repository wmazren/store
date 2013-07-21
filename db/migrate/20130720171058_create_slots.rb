class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.string :name
      t.string :state
      t.integer :warehouse_id
      t.integer :level_id
      t.integer :package_id

      t.timestamps
    end

    add_index :slots, :level_id
    add_index :slots, :package_id
    add_index :slots, :warehouse_id
  end
end
