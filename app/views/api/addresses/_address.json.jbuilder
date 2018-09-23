json.extract! address, :id, :street, :city, :county, :postcode, :created_at, :updated_at
json.url api_address_url(address, format: :json)
