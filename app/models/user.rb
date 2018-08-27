class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :image_name, {presence: true}
  validates :password, {presence: true}
  validates :user_id, {presence: true}

  def posts
    return Post.where(user_id: self.id)
  end

end
