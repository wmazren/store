class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :package, :inverse_of => :items

  validates :name, :presence => true
  validates :item_date, :presence => true
  validates :item_type, :presence => true

  attr_accessible :name, :user_id, :item_date, :item_type

  before_validation :uppercase_fields

  def uppercase_fields
    self.name.upcase!
  end

end
