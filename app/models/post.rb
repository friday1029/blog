# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  content_en  :text
#  content_zh  :text
#  cover_image :text
#  intro_en    :text
#  intro_zh    :text
#  title_en    :string
#  title_zh    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Post < ApplicationRecord
  mount_base64_uploader :cover_image, CoverImageUploader
end
