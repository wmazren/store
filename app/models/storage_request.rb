class StorageRequest < ActiveRecord::Base
  belongs_to :user
  has_many :packages

  state_machine :initial => :new do
    event :drafted do
      transition :new => :draft
    end

    event :submited do
      transition :draft => :in_progress
    end

    event :completed do
      transition :open => :closed
    end
  end

  validates :packages, :presence => true

  accepts_nested_attributes_for :packages, :allow_destroy => true

  attr_accessible :due_date, :user_id, :packages_attributes
end

