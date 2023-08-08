class CreateBanners < ActiveRecord::Migration[6.1]
  def change
    create_table :banners do |t|
      t.string :title_zh
      t.string :title_en
      t.string :subtitle_zh
      t.string :subtitle_en
      t.text :image

      t.timestamps
    end
  end
end
