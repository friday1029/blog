# == Schema Information
#
# Table name: site_screenshots
#
#  id         :bigint           not null, primary key
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  work_id    :bigint           not null
#
# Indexes
#
#  index_site_screenshots_on_work_id  (work_id)
#
# Foreign Keys
#
#  fk_rails_...  (work_id => works.id)
#
class SiteScreenshot < ApplicationRecord
  mount_base64_uploader :image, ImageUploader
  belongs_to :work
end
