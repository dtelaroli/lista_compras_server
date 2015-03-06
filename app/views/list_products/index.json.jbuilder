json.array!(@list_products) do |list_product|
  json.extract! list_product, :id, :list_id, :product_id, :ok
  json.url list_product_url(list_product, format: :json)
end
