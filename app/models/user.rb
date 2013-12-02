class User < ActiveRecord::Base
  has_many :storage_requests
  has_many :retrieval_requests
  has_many :packages
  has_many :items

  validates :full_name, :role, :position, :user_type, :username, :presence => true
  validates :username, :uniqueness => true
  validates :username, length: { minimum: 6 }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :full_name, :business_unit, :role, :active, :email, :password, :password_confirmation, :remember_me,
                             :address1, :address2, :town, :postcode, :state, :phone1, :phone2, :phone3, :fax, :mobile, :user_type, :position,
                             :username, :current_password

  attr_accessor :current_password

  private

  def active_for_authentication?
    super && self.active
  end
end
