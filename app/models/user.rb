class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar

  has_many :whiskies
  has_many :memos
  has_many :blogs
end
