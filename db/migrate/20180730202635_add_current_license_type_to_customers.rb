class AddCurrentLicenseTypeToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :current_license_type, :string
  end
end
