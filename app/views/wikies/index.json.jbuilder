json.array!(@wikies) do |wiky|
  json.extract! wiky, :id, :title, :body, :user_id
  json.url wiky_url(wiky, format: :json)
end
