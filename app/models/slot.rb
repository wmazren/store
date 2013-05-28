class Slot < ActiveRecord::Base
  belongs_to :level
  belongs_to :package

  attr_accessible :level_id, :name, :package_id, :state
end
