json.array!(@shares) do |share|
  json.extract! share, :id, :user_id, :list_id
  json.url share_url(share, format: :json)
end
