class StorageRequest < ActiveRecord::Base
  has_paper_trail

  belongs_to :user
  has_many :packages, :inverse_of => :storage_request

  belongs_to :warehouse

  after_update :assign_slot
  after_update :check_status

  # state
  state_machine :state, :initial => 'new' do
    event :aaa do
      transition 'new' => 'in progress'
    end

    event :bbb do
      transition 'in progress' => 'pending collection'
    end

    event :ccc do
      transition 'pending collection' => 'collected'
    end

    event :ddd do
      transition 'collected' => 'stored'
    end

    event :eee do
      transition 'collected' => 'stored'
    end

    event :fff do
      transition 'stored' => 'closed'
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
  # validates_associated :packages, :presence => true

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
