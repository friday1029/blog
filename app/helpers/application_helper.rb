module ApplicationHelper
  def image_tag(source, options = {})
    source = 'https://picsum.photos/1600/900' if source.blank?
    super
  end
end
