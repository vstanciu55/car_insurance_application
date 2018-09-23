class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :county
      t.string :postcode

      t.timestamps null: false
    end
  end
end
