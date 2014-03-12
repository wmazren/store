class Stock < ActiveRecord::Base
  belongs_to :box
  belongs_to :box_request

  attr_accessible :box_id, :box_request_id, :state

  state_machine :initial => :available do
    event :assign do
      transition :available => :assigned
    end
  end
end
