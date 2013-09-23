class RetrievalRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :package

  state_machine :initial => 'new' do
    event :aaa do
      transition 'new' => 'pending retrieval'
    end

    event :bbb do
      transition 'pending retrieval' => 'delivered to client'
    end

    event :ccc do
      transition 'delivered to client' => 'pending collection'
    end

    event :ddd do
      transition 'pending collection' => 'collected'
    end

    event :eee do
      transition 'collected' => 'pending storage'
    end

    event :fff do
      transition 'pending storage' => 'closed'
    end
  end

  after_create :change_package_state
  after_update :check_status

  attr_accessible :user_id, :package_id, :state

  private

  def change_package_state
    self.package.retrieve
  end

  def check_status
    if self.state == "closed"
      self.package.completed
    end
  end
end
