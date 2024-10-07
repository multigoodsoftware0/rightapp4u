json.extract! product, :id, :title, :description, :slug, :sku, :deal_active, :product_type, :created_at, :updated_at
json.url product_url(product, format: :json)
