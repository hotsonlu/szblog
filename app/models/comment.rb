class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :post_id

  validates :name, presence: true
  validates :email, presence: true
  validates :content, presence: true


end
