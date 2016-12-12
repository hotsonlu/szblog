class Post < ApplicationRecord

  has_many :comments

  validates :title, presence: {message: "title can't be blank"}
  validates :content, uniqueness: {message: "the content exist"}

   has_many :posts_tags, class_name: 'PostsTags'
   has_many :tags, through: :posts_tags

  #  def visited
  #   self.visited_count += 1
  #   self.save
  #   self.visited_count
  # end
end
