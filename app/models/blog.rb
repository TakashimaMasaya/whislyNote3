class Blog < ApplicationRecord
  validates :description, presence: true

  has_one_attached :thumbnail
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy  #Post.commentsで、投稿が所有するコメントw取得できる。

  def favorited?(user)
   favorites.where(user_id: user.id).exists?
  end
end
