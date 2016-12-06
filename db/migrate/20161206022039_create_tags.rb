class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :title

      t.timestamps
    end

    create_table :posts_tags do |t|
      t.integer :blog_id
      t.integer :tag_id
    end
  end
end
