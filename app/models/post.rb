# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content_en :text
#  content_zh :text
#  title_en   :string
#  title_zh   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
end
