json.array!(@lists) do |list|
  json.extract! list, :id, :user_id, :name, :archived, :created_at
  json.url list_url(list, format: :json)
end
