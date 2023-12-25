class Room < ApplicationRecord
  belongs_to :host, class_name: 'User', foreign_key: :user_id
  has_many :participants, dependent: :destroy
  has_many :users,through: :participants
  has_many :messages

  validates_uniqueness_of :name

  scope :public_rooms, -> { where(is_private: false) }
  scope :private_rooms, -> { where(is_private: true) }
  

  
end
