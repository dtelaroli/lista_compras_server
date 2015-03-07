json.array!(@shares) do |share|
  json.extract! share, :id, :user, :list, :list_products, :created_at
  json.url share_url(share, format: :json)
end
