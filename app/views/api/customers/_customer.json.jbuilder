json.extract! customer, :id, :title, :forename, :surname, :email, :date_of_birth, :license_period, :job_title, :current_license_type, :address
json.url api_customer_url(customer, format: :json)
