class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :image_name, {presence: true}
  validates :password, {presence: true}
  #validates :user_id, {presence: true}
  def posts
    return Post.where(user_id: self.id)
  end

  has_many :likes
  has_many :posts, through: :likes

<<<<<<< HEAD
  has_many :active_relationships,class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :active_relationships,class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower
  def follow(other_user)
    active_relationships.create(following_id: other_user.id)
  end
  def unfollow(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end
  def following?(other_user)
    following.include?(other_user)
  end
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

=======
>>>>>>> origin/master
end
