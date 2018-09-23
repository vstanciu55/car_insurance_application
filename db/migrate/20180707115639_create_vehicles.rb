class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vehicle_registration
      t.integer :estimated_annual_mileage
      t.integer :estimated_vehicle_value
      t.string :typical_parking_location
      t.date :policy_start_date

      t.timestamps null: false
    end
  end
end
