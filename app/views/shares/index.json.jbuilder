json.array!(@shares) do |share|
  json.extract! share, :id, :user, :list, :list_products
  json.url share_url(share, format: :json)
end
