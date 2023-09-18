class AddIsTopToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :is_top, :boolean, default: false
  end
end
