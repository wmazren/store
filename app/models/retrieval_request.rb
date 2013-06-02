class RetrievalRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :package

  state_machine :initial => :new do
    event :started do
      transition :new => :in_progress
    end

    event :delivered do
      transition :in_progress => :delivered_to_client
    end

    event :collected do
      transition :delivered_to_client => :pending_storage
    end

    event :completed do
      transition :pending_storage => :closed
    end
  end

  after_create :change_package_state
  after_update :check_status

  attr_accessible :user_id, :package_id, :state

  private

  def change_package_state
    self.package.started
  end

  def check_status
    if self.state == "closed"
      self.package.completed
    end
  end
end
