json.extract! post, :id, :name, :content, :image_url, :published, :created_at, :updated_at
json.url post_url(post, format: :json)
