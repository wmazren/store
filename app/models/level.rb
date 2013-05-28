class Level < ActiveRecord::Base
  belongs_to :bay
  has_many :slots

  after_create :create_slot_records

  attr_accessible :bay_id, :name, :num_of_slots_per_level

  private

  def create_slot_records
    slt = self.num_of_slots_per_level.to_i

    slt.times do |y|
      self.slots.create(:name => y + 1)
    end
  end
end
