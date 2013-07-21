class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.integer :num_of_slots_per_level
      t.integer :bay_id

      t.timestamps
    end

    add_index :levels, :bay_id
  end
end
