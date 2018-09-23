class AddCustomerToVehicles < ActiveRecord::Migration
  def change
    add_reference :vehicles, :customer
  end
end
