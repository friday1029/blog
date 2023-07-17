module AdminHelper
  def editor(object, column, textarea_class = 'article-content')
    text_area(object.class.to_s.underscore.to_sym, column.to_sym, class: textarea_class) +
    content_tag(:div, raw(object.try(column)), class: 'content-editor', style: "height: 500px")
  end

  def nl2br(string)
    return unless string
    string = string.gsub(/(\r)?\n/, "<br>")
    return string
  end
end
