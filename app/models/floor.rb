class Floor < ActiveRecord::Base
  belongs_to :warehouse
  has_many :bays

  attr_accessible :name, :warehouse_id, :bays_attributes

  accepts_nested_attributes_for :bays, :allow_destroy => true
end
