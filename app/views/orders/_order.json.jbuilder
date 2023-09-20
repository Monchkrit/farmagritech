json.extract! order, :id, :street, :city, :zipcode, :state, :created_at, :updated_at
json.url order_url(order, format: :json)
