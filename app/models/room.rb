class Room < ApplicationRecord
  belongs_to :host, class_name: 'User', foreign_key: :user_id
  has_many :users,through: :participants
  has_many :participants, dependent: :destroy
  has_many :messages

  validates_uniqueness_of :name
end
