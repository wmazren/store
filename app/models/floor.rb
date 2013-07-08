class Floor < ActiveRecord::Base
  belongs_to :warehouse
  has_many :bays

  has_many :levels, :through => :bays
  has_many :slots, :through => :levels

  attr_accessible :name, :warehouse_id, :bays_attributes

  accepts_nested_attributes_for :bays, :allow_destroy => true
end


#document - warehouse
#section - floor
#paragraph -  bay

