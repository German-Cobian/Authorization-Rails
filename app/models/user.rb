class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: self

  validates :email, presence: true
  with_options presence: true do
    validates :password, on: :create
  end
 

  enum is_enabled: { disabled: false, enabled: true }
  enum role: %i[user admin]

  def set_default_role
    self.role ||= :user
  end

 

end
