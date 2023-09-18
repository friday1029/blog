# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  content_en   :text
#  content_zh   :text
#  cover_image  :text
#  intro_en     :text
#  intro_zh     :text
#  is_published :boolean          default(FALSE)
#  is_top       :boolean          default(FALSE)
#  title_en     :string
#  title_zh     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Post < ApplicationRecord
  mount_base64_uploader :cover_image, CoverImageUploader
  scope :published, -> { where(is_published: true) } 
  scope :default_order, -> { order(is_top: :desc, id: :asc) } 
  def older
    if self.id == Post.published.order(:id).first.id
      nil
    else
      item_ids = Post.published.order(:id).ids
      older_id = item_ids[item_ids.index(self.id) - 1]
      Post.find(older_id)
    end
  end

  def newer
    if self.id == Post.published.order(:id).last.id
      nil
    else
      item_ids = Post.published.order(:id).ids
      newer_id = item_ids[item_ids.index(self.id) + 1]
      Post.find(newer_id)
    end
  end

end
