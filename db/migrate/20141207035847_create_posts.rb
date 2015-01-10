class CreatePosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
