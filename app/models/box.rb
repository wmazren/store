class Box < ActiveRecord::Base
  has_paper_trail
  has_many :stocks

  after_save :create_stocks

  attr_accessible :quantity

  def create_stocks
    quantity.times do |x|
      self.stocks.create
    end
  end
end
