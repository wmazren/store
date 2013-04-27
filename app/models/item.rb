class Item < ActiveRecord::Base
  attr_accessible :name
  belongs_to :package
end
