class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :package

  validates :name, :presence => true

  attr_accessible :name, :user_id
end
