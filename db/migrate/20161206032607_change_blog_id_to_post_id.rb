class ChangeBlogIdToPostId < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts_tags, :blog_id, :post_id
  end
end
