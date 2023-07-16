class CreateEditorImages < ActiveRecord::Migration[6.1]
  def change
    create_table :editor_images do |t|
      t.text :image

      t.timestamps
    end
  end
end
