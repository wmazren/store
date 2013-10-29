class BoxRequest < ActiveRecord::Base
  belongs_to :user

  attr_accessible :quantity, :user_id

  # state
  state_machine :state, :initial => 'new' do
    event :aaa do
      transition 'new' => 'in progress'
    end

    event :bbb do
      transition 'in progress' => 'pending delivery'
    end

    event :ccc do
      transition 'pending delivery' => 'delivered'
    end

    event :ddd do
      transition 'delivered' => 'closed'
    end
  end
end
