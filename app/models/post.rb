class Post < ApplicationRecord

  has_many :comments
  has_many :likes

  validates :title, presence: {message: "title can't be blank"}
  validates :content, uniqueness: {message: "the content exist"}

   has_many :posts_tags, class_name: 'PostsTags'
   has_many :tags, through: :posts_tags

 
end
