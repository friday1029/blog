# == Schema Information
#
# Table name: works
#
#  id         :bigint           not null, primary key
#  desc_en    :text
#  desc_zh    :text
#  name_en    :string
#  name_zh    :string
#  site_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Work < ApplicationRecord
end
