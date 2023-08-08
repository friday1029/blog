# == Schema Information
#
# Table name: banners
#
#  id          :bigint           not null, primary key
#  image       :text
#  subtitle_en :string
#  subtitle_zh :string
#  title_en    :string
#  title_zh    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Banner < ApplicationRecord
  mount_base64_uploader :image, BannerImageUploader
end
