json.extract! driverhistory, :id, :no_of_incidents, :created_at, :updated_at
json.url api_driverhistory_url(driverhistory, format: :json)
