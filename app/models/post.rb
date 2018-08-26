class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 30}}
  validates :content_music, {presence: true, uniqueness: true}
  validates :content_image, {presence: true, uniqueness: true}
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end

end
