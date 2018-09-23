class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.date :date_of_incident
      t.integer :value
      t.string :type
      t.string :description

      t.timestamps null: false
    end
  end
end
