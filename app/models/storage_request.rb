class StorageRequest < ActiveRecord::Base
  attr_accessible :due_date, :user_id, :packages_attributes

  belongs_to :user
  has_many :packages

  validates :due_date, :packages, :presence => true

  accepts_nested_attributes_for :packages, :allow_destroy => true

 # validate :check_packages
 # def check_packages
#  if self.packages.size < 1 || self.packages.all?{|package| package.marked_for_destruction? }
 #     errors[:base] << "Each storage request must have at least one package."
  #  end
  # end
end


