class AddCustomerToOccupation < ActiveRecord::Migration
  def change
    add_reference :occupations, :customer, index: true, foreign_key: true
  end
end
