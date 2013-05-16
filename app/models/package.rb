class Package < ActiveRecord::Base
  belongs_to :user
  belongs_to :storage_request
  belongs_to :retrieval_request
  has_many :items

  validates :reference_id, :items, :presence => true

  accepts_nested_attributes_for :items, allow_destroy: true

  attr_accessible :reference_id, :user_id, :items_attributes
end
