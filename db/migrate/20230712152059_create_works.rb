class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :name_zh
      t.string :name_en
      t.string :site_url
      t.text :desc_zh
      t.text :desc_en

      t.timestamps
    end
  end
end
