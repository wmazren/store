class Warehouse < ActiveRecord::Base

  has_many :storage_requests

  has_many :floors
  has_many :bays, :through => :floors
  has_many :levels, :through => :bays
  has_many :slots, :through => :levels

  attr_accessible :name, :floors_attributes

  accepts_nested_attributes_for :floors, :allow_destroy => true
end
