class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar

  has_many :whiskies, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :comments  #User.commentsで、ユーザーの所有するコメントを取得できる。
end
