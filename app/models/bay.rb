class Bay < ActiveRecord::Base
  belongs_to :floor
  has_many :levels

  attr_accessible :floor_id, :name, :num_of_levels, :num_of_slots_per_level
end
