class AddCustomerToIncidents < ActiveRecord::Migration
  def change
    add_reference :incidents, :customer, index: true, foreign_key: true
  end
end
