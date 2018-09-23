require 'rest-client'
require 'json'
class InsuranceRestClient

  #@@DOMAIN = 'https://rubyonrailstraining-valentinstaciu55.c9users.io'
  #@@DOMAIN = 'http://0.0.0.0:8080'
  @@DOMAIN = 'http://localhost:3000'
   def run_menu
    loop do
      display_menu
      option = STDIN.gets.chomp.upcase
      case option
        when '1'
          puts 'Displaying customers:'
          display_customers
        when '2'
          puts 'Displaying customer:'
          display_customer
        when '3'
          puts 'Creating customer:'
          create_customer
        when '4'
          puts 'Updating customer:'
          update_customer
        when '5'
          puts 'Deleting customer:'
          delete_customer
        when '6'
          puts 'Displaying vehicles:'
          display_vehicles
        when '7'
          puts 'Creating vehicle:'
          create_vehicle
        when '8'
          puts 'Deleting vehicle:'
          delete_vehicle
        when '9'
          puts 'Displaying incidents:'
          display_incidents
        when '10'
          puts 'Creating incident:'
          create_incident
        when '11'
          puts 'Deleting incident:'
          delete_incident
        when '12'
          puts 'Displaying premia:'
          display_premia
        when '13'
          puts 'Calculating premium:'
          calculate_premium
        when 'Q'
          break
        else
          puts "Option #{option} is unknown."
      end
    end
  end
   private

  def display_menu
    puts 'Enter option: '
    puts '1. Display customers'
    puts '2. Display customer by ID'
    puts '3. Create new customer'
    puts '4. Update customer by ID'
    puts '5. Delete customer by ID'
    puts '6. Display vehicles'
    puts '7. Create new vehicle'
    puts '8. Delete vehicle by ID'
    puts '9. Display incidents'
    puts '10. Create new incident'
    puts '11. Delete incident by ID'
    puts '12. Display premia'
    puts '13. Calculate premium'
    puts 'Q. Quit'
  end
 
   def display_customers
    begin
      response = RestClient.get "#{@@DOMAIN}/api/customers.json"

      puts "Response code: #{response.code}"
      puts "Response cookies:\n #{response.cookies}\n\n"
      puts "Response headers:\n #{response.headers}\n\n"
      puts "Response content:\n #{response.to_str}"

      js = JSON response.body
      js.each do |item_hash|
        item_hash.each do |k,v|
          puts "#{k}: #{v}"
        end
      end
    rescue => e
      puts STDERR, "Error accessing REST service. Error: #{e}"
    end
   end
   
   def display_vehicles
    begin
      response = RestClient.get "#{@@DOMAIN}/api/vehicles.json"

      js = JSON response.body
      js.each do |item_hash|
        item_hash.each do |k,v|
          puts "#{k}: #{v}"
        end
      end
    rescue => e
      puts STDERR, "Error accessing REST service. Error: #{e}"
    end
   end
  
  def display_customer
    begin
      print "Enter the user ID: "
      id = STDIN.gets.chomp
      response = RestClient.get "#{@@DOMAIN}/api/customers/#{id}.json"
      js = JSON response.body
      js.each do |k,v|
        puts "#{k}: #{v}"
      end
    rescue => e
        puts STDERR, "Error accessing REST service. Error: #{e}"
    end
  end
  
  def display_incidents
    begin
      response = RestClient.get "#{@@DOMAIN}/api/incidents.json"

      js = JSON response.body
      js.each do |item_hash|
          item_hash.each do |k,v|
            puts "#{k}: #{v}"
          end
      end
    rescue => e
      puts STDERR, "Error accessing REST service. Error: #{e}"
    end
  end
  
  def create_customer
    begin
      print "Title: "
      title = STDIN.gets.chomp
      print "Forename: "
      forename = STDIN.gets.chomp
      print "Surname: "
      surname = STDIN.gets.chomp
      print "Date of birth: "
      date_of_birth = STDIN.gets.chomp
      print "License period: "
      email = STDIN.gets.chomp
      print "Job title: "
      job_title = STDIN.gets.chomp
      print "Current License Type: "
      license_period = STDIN.gets.chomp
      print "Email: "
      current_license_type = STDIN.gets.chomp
      print "Street: "
      street = STDIN.gets.chomp
      print "City: "
      city = STDIN.gets.chomp
      print "County: "
      county = STDIN.gets.chomp
      print "Postcode: "
      postcode = STDIN.gets.chomp
      
      response = RestClient.post "#{@@DOMAIN}/api/customers.json",
          {
              customer: {
                  title: title,
                  forename: forename,
                  surname: surname,
                  date_of_birth: date_of_birth,
                  email: email,
                  job_title: job_title,
                  license_period: license_period,
                  current_license_type: current_license_type,
                  address: {
                    street: street,
                    city: city,
                    county: county,
                    postcode: postcode,
                  }
              }

          }
      if(response.code == 201)
        puts "Created successfully"
      end
      puts "URL for new resource: #{response.headers[:location]}"
    rescue => e
      puts STDERR, "Error accessing REST service. Error: #{e}"
    end
  end
  def create_vehicle
    begin
      print "Customer ID: "
      customer_id = STDIN.gets.chomp
      print "Vehicle registration: "
      vehicle_registration = STDIN.gets.chomp
      print "Estimated annual mileage: "
      estimated_annual_mileage = STDIN.gets.chomp
      print "Estimated vehicle value: "
      estimated_vehicle_value = STDIN.gets.chomp
      print "Typical parking location: "
      type_of_incident = STDIN.gets.chomp
      print "Policy start date: "
      policy_start_date = STDIN.gets.chomp
      
      response = RestClient.post "#{@@DOMAIN}/api/customers.json",
          {
              customer: {
                  customer_id: customer_id,
                  vehicle_registration: vehicle_registration,
                  estimated_annual_mileage: estimated_annual_mileage,
                  estimated_vehicle_value: estimated_vehicle_value,
                  typical_parking_location: typical_parking_location,
                  policy_start_date: policy_start_date
              }

          }
      if(response.code == 201)
        puts "Created successfully"
      end
      puts "URL for new resource: #{response.headers[:location]}"
    rescue => e
      puts STDERR, "Error accessing REST service. Error: #{e}"
    end
  end
  
  def create_incident
    begin
      print "Customer ID: "
      customer_id = STDIN.gets.chomp
      print "Date of incident: "
      date_of_incident = STDIN.gets.chomp
      print "Value: "
      value = STDIN.gets.chomp
      print "Type of incident: "
      type_of_incident = STDIN.gets.chomp
      print "Description: "
      description = STDIN.gets.chomp
      
      response = RestClient.post "#{@@DOMAIN}/api/incidents.json",
          {
              incident: {
                  customer_id: customer_id,
                  date_of_incident: date_of_incident,
                  value: value,
                  type_of_incident: type_of_incident,
                  description: description
              }

          }
      if(response.code == 201)
        puts "Created successfully"
      end
      puts "URL for new resource: #{response.headers[:location]}"
    rescue => e
      puts STDERR, "Error accessing REST service. Error: #{e}"
    end
  end
  def delete_vehicle
    begin
      print "Enter the user ID: "
      id = STDIN.gets.chomp
      response = RestClient.delete "#{@@DOMAIN}/api/vehicles/#{id}.json"

      if(response.code == 204)
        puts "Deleted successfully"
      end
    rescue => e
      puts STDERR, "Error accessing REST service. Error: #{e}\n"
    end
  end
  
  def delete_incident
    begin
      print "Enter the user ID: "
      id = STDIN.gets.chomp
      response = RestClient.delete "#{@@DOMAIN}/api/incidents/#{id}.json"

      if(response.code == 204)
        puts "Deleted successfully"
      end
    rescue => e
      puts STDERR, "Error accessing REST service. Error: #{e}\n"
    end
  end

  def delete_customer
    begin
      print "Enter the user ID: "
      id = STDIN.gets.chomp
      response = RestClient.delete "#{@@DOMAIN}/api/customers/#{id}.json"

      if(response.code == 204)
        puts "Deleted successfully"
      end
    rescue => e
      puts STDERR, "Error accessing REST service. Error: #{e}\n"
    end
  end
  
  def display_premia
    begin
      response = RestClient.get "#{@@DOMAIN}/api/premia.json"

      js = JSON response.body
      js.each do |item_hash|
        item_hash.each do |k,v|
          puts "#{k}: #{v}"
        end
      end
    rescue => e
      puts STDERR, "Error accessing REST service. Error: #{e}"
    end
  end

  def calculate_premium
    begin
      print "Enter the driver history ID: "
      id = STDIN.gets.chomp
      response = RestClient.get "#{@@DOMAIN}/api/driverhistories/#{id}.json"
      js = JSON response.body
      hash = JSON.parse(response)
      no_of_incidents = hash['no_of_incidents']
      premium_value = no_of_incidents * 1000
      response = RestClient.post "#{@@DOMAIN}/api/premia.json",
          {
              premium: {
                  customer_id: id,
                  value: premium_value
              }

          }
      if(response_new.code == 201)
        puts "The premium amount is:#{premium_value}$"
      end
      rescue => e
        puts STDERR, "Error accessing REST service. Error: #{e}\n"
    end
  end
end
client = InsuranceRestClient.new
client.run_menu