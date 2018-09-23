class CreatePremia < ActiveRecord::Migration
  def change
    create_table :premia do |t|
      t.integer :value

      t.timestamps null: false
    end
  end
end
