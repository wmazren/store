class Slot < ActiveRecord::Base
  belongs_to :level
  belongs_to :package

  state_machine :initial => :available do
  end

  attr_accessible :level_id, :name, :package_id, :state
end
