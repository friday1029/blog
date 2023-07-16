# == Schema Information
#
# Table name: editor_images
#
#  id         :bigint           not null, primary key
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class EditorImage < ApplicationRecord
  mount_base64_uploader :image, EditorImageUploader
end
