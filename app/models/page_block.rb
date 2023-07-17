# == Schema Information
#
# Table name: page_blocks
#
#  id         :bigint           not null, primary key
#  content_en :text
#  content_zh :text
#  meta_key   :string
#  note       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PageBlock < ApplicationRecord
  validates :meta_key, presence: true, uniqueness: true
end
