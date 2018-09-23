json.extract! vehicle, :id, :vehicle_registration, :estimated_annual_mileage, :estimated_vehicle_value, :typical_parking_location, :policy_start_date, :customer_id
json.url api_vehicle_url(vehicle, format: :json)
