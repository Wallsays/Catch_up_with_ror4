json.array!(@products) do |product|
  json.extract! product, :title, :body, :category_id
  json.url product_url(product, format: :json)
end
