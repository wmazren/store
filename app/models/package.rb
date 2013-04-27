class Package < ActiveRecord::Base
  attr_accessible :reference_id
  belongs_to :storage_request
  belongs_to :user
  has_many :items
end
