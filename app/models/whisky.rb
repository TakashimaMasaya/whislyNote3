class Whisky < ApplicationRecord
  validates :name, presence: true
  
  has_one_attached :image

  has_many :whisky_users, dependent: :destroy
  has_many :users, through: :whisky_users, dependent: :destroy
end
