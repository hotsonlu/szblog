class PostsTags < ApplicationRecord
  self.table_name = 'posts_tags'

  validates_uniqueness_of :post_id, scope: [:tag_id]

  belongs_to :post
  belongs_to :tag
end
