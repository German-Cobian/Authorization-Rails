class Conversation < ApplicationRecord
  belongs_to :user
  has_many :users,through: :locutors
  has_many :locutors, dependent: :destroy
  validates :title, presence: true
  has_many :exchanges

  accepts_nested_attributes_for :locutors
end
