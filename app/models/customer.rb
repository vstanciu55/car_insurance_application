class Customer < ActiveRecord::Base
    
    validates_presence_of :title, :forename, :surname, :job_title, :email, :current_license_type
    validates_numericality_of :license_period, greater_than_or_equal_to: 0
    validates_format_of :email,
                      with: /\A([\w\.\-\+]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                      message: 'Bad email address format'
    has_many :vehicles
    has_many :incidents
    has_one :address
    has_one :driverhistory
    has_one :premium
    
    attr_accessor :street, :city, :county, :postcode
    accepts_nested_attributes_for :address
    accepts_nested_attributes_for :driverhistory
    

end
