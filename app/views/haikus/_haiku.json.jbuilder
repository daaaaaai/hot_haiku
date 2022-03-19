json.extract! haiku, :id, :content, :author_name, :created_at, :updated_at
json.url haiku_url(haiku, format: :json)
