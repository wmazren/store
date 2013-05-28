class Level < ActiveRecord::Base
  belongs_to :bay
  has_many :slots

  attr_accessible :bay_id, :name
end
