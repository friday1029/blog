# == Schema Information
#
# Table name: works
#
#  id         :bigint           not null, primary key
#  desc_en    :text
#  desc_zh    :text
#  intro_en   :text
#  intro_zh   :text
#  logo       :text
#  name_en    :string
#  name_zh    :string
#  site_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Work < ApplicationRecord
  mount_base64_uploader :logo, LogoUploader
  before_save :remove_html_tags_from_content

  private

  def remove_html_tags_from_desc
    self.desc_zh = ActionView::Base.full_sanitizer.sanitize(self.desc_zh)
    self.desc_en = ActionView::Base.full_sanitizer.sanitize(self.desc_en)
  end
end
