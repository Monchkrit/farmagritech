json.extract! listing, :id, :name, :description, :product_type, :market_date, :price, :created_at, :updated_at
json.url listing_url(listing, format: :json)
