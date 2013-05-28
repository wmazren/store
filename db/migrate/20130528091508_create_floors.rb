class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.string :name
      t.integer :warehouse_id

      t.timestamps
    end
  end
end
