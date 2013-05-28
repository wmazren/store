class AddNumOfSlotsPerLevelToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :num_of_slots_per_level, :integer
  end
end
