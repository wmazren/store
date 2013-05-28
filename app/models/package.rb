class Package < ActiveRecord::Base
  belongs_to :user
  belongs_to :storage_request
  has_many :retrieval_requests
  has_many :items

  state_machine :initial => :virgin do
    event :retrieve do
      transition :virgin => :in_progress
    end

    event :completed do
      transition :in_progress => :virgin
    end
  end

  validates :reference_id, :items, :presence => true

  accepts_nested_attributes_for :items, allow_destroy: true

  attr_accessible :reference_id, :user_id, :status, :items_attributes

  before_validation :uppercase_fields

  def uppercase_fields
    self.reference_id.upcase!
  end
end
