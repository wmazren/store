class Warehouse < ActiveRecord::Base
  has_many :floors
  has_many :storage_requests
  has_many :slots

  attr_accessible :name, :floors_attributes

  accepts_nested_attributes_for :floors, :allow_destroy => true
end
