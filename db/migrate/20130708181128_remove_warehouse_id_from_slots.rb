class RemoveWarehouseIdFromSlots < ActiveRecord::Migration
  def up
    remove_column :slots, :warehouse_id
  end

  def down
    add_column :slots, :warehouse_id, :integer
  end
end
