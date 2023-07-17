class CreatePageBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :page_blocks do |t|
      t.string :meta_key
      t.text :content_zh
      t.text :content_en
      t.string :note

      t.timestamps
    end
  end
end
