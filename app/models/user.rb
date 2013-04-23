class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :full_name, :business_unit, :role, :active, :email, :password, :password_confirmation, :remember_me,
                             :address1, :address2, :town, :postcode, :state
  # attr_accessible :title, :body

  def active_for_authentication?
    super && self.active
  end
end
