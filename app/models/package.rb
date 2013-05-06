class Package < ActiveRecord::Base
  attr_accessible :reference_id, :items_attributes
  belongs_to :storage_request
  belongs_to :user
  has_many :items
  validates :reference_id, :items, :presence => true
  accepts_nested_attributes_for :items, allow_destroy: true

 # validate :check_items
  #def check_items
   # if self.items.size < 1 || self.items.all?{|item| item.marked_for_destruction? }
    #  errors[:base] << "Each storage request must have at least one item."
  #  end
 # end
end
