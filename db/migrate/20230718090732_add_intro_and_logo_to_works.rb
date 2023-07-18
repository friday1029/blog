class AddIntroAndLogoToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :logo, :text
    add_column :works, :intro_zh, :text
    add_column :works, :intro_en, :text
  end
end
