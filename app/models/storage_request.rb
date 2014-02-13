class StorageRequest < ActiveRecord::Base
  has_paper_trail

  belongs_to :user
  has_many :packages, :inverse_of => :storage_request, :dependent => :destroy

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

  def self.chart_data(start = 2.months.ago)
    total_count = total_count_by_month(start)

    ##############################################
    start = start.to_date.beginning_of_month
    today = Date.today.beginning_of_month
    range = (start..today).select {|d| d.day == 1}
    ##############################################

    range.map do |month|
      {
        created_at: month.strftime("%b"),
        requests: total_count[month.strftime("%-m").to_i] || 0
      }
    end
  end

  def self.total_count_by_month(start)
    storage_requests = where(created_at: start.beginning_of_month..Time.now)
    storage_requests = storage_requests.group("MONTH(created_at)")
    storage_requests = storage_requests.select("MONTH(created_at) as month_created_at , count(*) as total_requests")
    storage_requests.each_with_object({}) do |storage_request, counts|
      counts[storage_request.month_created_at] = storage_request.total_requests
    end
  end

end
