class AddCoverImageAndIntroToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :cover_image, :text
    add_column :posts, :intro_zh, :text
    add_column :posts, :intro_en, :text
  end
end
