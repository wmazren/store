class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.string :name
      t.string :state
      t.integer :level_id
      t.integer :package_id

      t.timestamps
    end
  end
end
