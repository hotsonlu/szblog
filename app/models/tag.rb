class Tag < ApplicationRecord
  validates :title, uniqueness: {message: "tag 已经存在"}

  has_many :posts_tags, class_name: "PostsTags"
  has_many :posts, through: :posts_tags
end
