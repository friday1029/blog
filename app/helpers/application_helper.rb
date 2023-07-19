module ApplicationHelper
  def image_tag(source, options = {})
    source = 'https://picsum.photos/1600/900' if source.blank?
    super
  end

  def url_format(string)
    # 定義一個簡單的正則表達式來辨識網址格式
    url_pattern = /\Ahttps?:\/\/\S+\z/
    # 使用正則表達式進行匹配
    (string =~ url_pattern) ? string : "https://#{string}"
  end
end