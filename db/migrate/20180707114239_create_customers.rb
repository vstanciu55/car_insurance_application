class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :title
      t.string :forename
      t.string :surname
      t.string :email
      t.date :date_of_birth
      t.integer :license_period

      t.timestamps null: false
    end
  end
end
