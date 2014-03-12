class BoxRequest < ActiveRecord::Base
  has_paper_trail

  belongs_to :user
  has_many :stocks

  before_update :check_stock

  attr_accessible :quantity, :user_id, :state

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

  def check_stock
    #if self.state != "new"
    if self.stocks.count <= 0
      find_stock = Stock.where(:state => "available").count
      if find_stock >= self.quantity
        self.quantity.times do |x|
          find_stock_and_change_state = Stock.where(:state => "available").first
          find_stock_and_change_state.assign
          find_stock_and_change_state.box_request_id = self.id
          find_stock_and_change_state.save
        end
      else
        return false
        self.errors.full_messages.each do |message|
          errors[:base] << "error"
        end
      end
    end
  end
end
