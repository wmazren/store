class Warehouse < ActiveRecord::Base
  has_many :floors

  attr_accessible :name, :floors_attributes

  accepts_nested_attributes_for :floors, :allow_destroy => true
end
