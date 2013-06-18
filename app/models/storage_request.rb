class StorageRequest < ActiveRecord::Base
  belongs_to :user
  has_many :packages
  belongs_to :warehouse

  after_update :assign_slot
  after_update :check_status

  # state
  state_machine :initial => :new do
    event :started do
      transition :new => :in_progress
    end

    event :completed do
      transition :in_progress => :closed
    end
  end

  # submit_state
  state_machine  :submit_state, :initial => :submit do
    event :drafted do
      transition :submit => :draft
    end

    event :submited do
      transition :draft => :submit
    end

    event :closer do
      transition :submit => :closed_storage_request
    end
  end

  validates :packages, :presence => true

  accepts_nested_attributes_for :packages, :allow_destroy => true

  attr_accessible :due_date, :user_id, :state, :packages_attributes, :warehouse_id

  private

  def assign_slot
    if self.warehouse
      self.packages.each do |package|
        if package.slot.nil?
          find_slot = Slot.where(:state => "available", :warehouse_id => self.warehouse_id).first
          find_slot.assign
          find_slot.package_id = package.id
          find_slot.save
        end
      end
    end
  end

  def check_status
    if self.state == "closed"
      self.packages.each do |package|
        package.store
      end
    end
  end
end

