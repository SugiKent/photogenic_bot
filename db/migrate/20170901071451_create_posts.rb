class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.text :image_url
      t.boolean :published

      t.timestamps
    end
  end
end
