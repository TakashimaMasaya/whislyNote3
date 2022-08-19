class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  # validates :validate_email

  has_secure_password
  has_one_attached :avatar

  has_many :whisky_users, dependent: :destroy
  has_many :whiskies, through: :whisky_users, dependent: :destroy

  has_many :memos, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :comments  #User.commentsで、ユーザーの所有するコメントを取得できる。

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  private

  def validate_email
    errors.add(:email, 'メールドレスの形式である必要があります') unless email&.include?('@')
  end
end
