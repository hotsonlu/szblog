class DropComments < ActiveRecord::Migration[5.0]
  def change
    drop_table :comments do |t|
      t.string   "name"
      t.string   "email"
      t.text     "content"
      t.integer  "post_id"
      t.timestamps
    end
  end
end
