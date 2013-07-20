class AddWarehouseId2ToSlots < ActiveRecord::Migration
  def change
    add_column :slots, :warehouse_id, :integer
  end
end
