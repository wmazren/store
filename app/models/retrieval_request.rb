class RetrievalRequest < ActiveRecord::Base
  belongs_to :user
  # has_many :packages
  belongs_to :package

  attr_accessible :user_id, :package_id
end
