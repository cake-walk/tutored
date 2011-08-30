class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.integer :user_id
      t.string :category
      t.string :url

      t.timestamps
    end
  end
end
