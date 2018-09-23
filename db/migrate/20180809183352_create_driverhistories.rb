class CreateDriverhistories < ActiveRecord::Migration
  def change
    create_table :driverhistories do |t|
      t.integer :no_of_incidents

      t.timestamps null: false
    end
  end
end
