class RetrievalRequest < ActiveRecord::Base
  belongs_to :user
  has_many :packages

  attr_accessible :user_id
end
