class Package < ActiveRecord::Base
  belongs_to :user
  belongs_to :storage_request
  has_many :retrieval_requests
  has_many :items
  has_one :slot

  after_create :assign_barcode

  state_machine :initial => :new do
    event :store do
      transition :new => :stored
    end

    event :retrieve do
      transition :stored => :retrieval_in_progress
    end

    event :completed do
      transition :retrieval_in_progress => :stored
    end
  end

  validates :reference_id, :items, :presence => true

  accepts_nested_attributes_for :items, allow_destroy: true

  attr_accessible :reference_id, :user_id, :state, :items_attributes, :barcode

  before_validation :uppercase_fields

  def uppercase_fields
    self.reference_id.upcase!
  end

  def assign_barcode
    self.barcode = SecureRandom.hex(4).upcase
    self.save
  end
end
