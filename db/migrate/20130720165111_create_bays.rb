class CreateBays < ActiveRecord::Migration
  def change
    create_table :bays do |t|
      t.string :name
      t.integer :num_of_levels
      t.integer :num_of_slots_per_level
      t.integer :floor_id

      t.timestamps
    end

    add_index :bays, :floor_id
  end
end
