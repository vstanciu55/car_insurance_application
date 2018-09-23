class RemoveTypeOfIncidentFromIncidents < ActiveRecord::Migration
  def change
        remove_column :incidents, :body
  end
end
