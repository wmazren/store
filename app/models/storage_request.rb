class StorageRequest < ActiveRecord::Base
  attr_accessible :due_date, :user_id
  belongs_to :user
  has_many :packages
end
