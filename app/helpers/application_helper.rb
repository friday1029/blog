module ApplicationHelper
  def image_tag(source, options = {})
    return '' if source.blank?
    super
  end
end
