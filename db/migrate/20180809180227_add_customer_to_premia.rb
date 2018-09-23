class AddCustomerToPremia < ActiveRecord::Migration
  def change
    add_reference :premia, :customer, index: true, foreign_key: true
  end
end
