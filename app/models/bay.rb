class Bay < ActiveRecord::Base
  belongs_to :floor
  has_many :levels

  has_many :slots, :through => :levels

  after_create :create_level_records

  attr_accessible :floor_id, :name, :num_of_levels, :num_of_slots_per_level

  private

  def create_level_records
    lvl = self.num_of_levels

    lvl.times do |x|
      self.levels.create(:num_of_slots_per_level => self.num_of_slots_per_level, :name => x + 1)
    end
  end
end
