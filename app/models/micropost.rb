class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  has_many :likes, dependent: :destroy
  
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
