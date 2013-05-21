class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :package

  validates :name, :presence => true

  attr_accessible :name, :user_id

  before_validation :uppercase_fields

  def uppercase_fields
    self.name.upcase!
  end

end
