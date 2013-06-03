class Slot < ActiveRecord::Base
  belongs_to :level
  belongs_to :package
  belongs_to :warehouse

  state_machine :initial => :available do
    event :assign do
      transition :available => :assigned
    end
  end

  attr_accessible :level_id, :name, :package_id, :state, :warehouse_id
end
