class AddTypeOfIncidentToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :type_of_incident, :string
  end
end
