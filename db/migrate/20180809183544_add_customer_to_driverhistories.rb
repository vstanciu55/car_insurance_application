class AddCustomerToDriverhistories < ActiveRecord::Migration
  def change
    add_reference :driverhistories, :customer, index: true, foreign_key: true
  end
end
