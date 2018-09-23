json.extract! incident, :customer_id, :id, :date_of_incident, :value, :type_of_incident, :description
json.url api_incident_url(incident, format: :json)
