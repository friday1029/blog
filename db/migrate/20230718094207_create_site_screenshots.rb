class CreateSiteScreenshots < ActiveRecord::Migration[6.1]
  def change
    create_table :site_screenshots do |t|
      t.text :image
      t.references :work, null: false, foreign_key: true

      t.timestamps
    end
  end
end
