json.array!(@shares) do |share|
  json.extract! share, :id, :user, :list
  json.url share_url(share, format: :json)
end
