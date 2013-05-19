class StorageRequest < ActiveRecord::Base
  belongs_to :user
  has_many :packages

  validates :packages, :presence => true

  accepts_nested_attributes_for :packages, :allow_destroy => true

  attr_accessible :due_date, :user_id, :packages_attributes
end

