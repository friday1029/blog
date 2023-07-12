class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title_zh
      t.string :title_en
      t.text :content_zh
      t.text :content_en

      t.timestamps
    end
  end
end
