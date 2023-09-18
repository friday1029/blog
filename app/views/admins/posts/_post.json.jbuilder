json.extract! post, :id, :name_zh, :name_en, :site_url, :desc_zh, :desc_en, :created_at, :updated_at, :is_published, :is_top
json.url admins_post_url(post, format: :json)
