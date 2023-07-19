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
  before_save :remove_html_tags_from_intro
  has_many :site_screenshots, inverse_of: :work, dependent: :destroy
  accepts_nested_attributes_for :site_screenshots, reject_if: :all_blank, allow_destroy: true

  private

  def remove_html_tags_from_intro
    self.intro_zh = ActionView::Base.full_sanitizer.sanitize(self.intro_zh)
    self.intro_en = ActionView::Base.full_sanitizer.sanitize(self.intro_en)
  end
end
