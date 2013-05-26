class RetrievalRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :package

  state_machine :initial => :new do
    event :completed do
      transition :open => :closed
    end
  end

  after_create :change_package_state
  after_update :check_status

  attr_accessible :user_id, :status, :package_id

  private

  def change_package_state
    self.package.retrieve
  end

  def check_status
    if self.status == "completed"
      self.package.completed
    end
  end
end
