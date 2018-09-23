class RemoveTypeFromIncidents < ActiveRecord::Migration
  def change
    remove_column :incidents, :type
  end
end
