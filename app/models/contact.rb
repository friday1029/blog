# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  content    :text
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Contact < ApplicationRecord
  before_save :remove_html_tags_from_content

  private

  def remove_html_tags_from_content
    self.content = ActionView::Base.full_sanitizer.sanitize(self.content)
  end
end
