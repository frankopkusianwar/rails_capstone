class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :fullname, presence: true
  has_many :opinions, dependent: :destroy
  
  has_many :active_relationships, class_name: "Following", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Following", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_one_attached :image
  has_one_attached :cover_image

  has_many :comments, dependent: :destroy

  # Following a user.
  def follow(other_user)
    following << other_user
  end
  # Unfollowing a user.
  def unfollow(other_user)
    following.delete(other_user)
  end
  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
  
end
