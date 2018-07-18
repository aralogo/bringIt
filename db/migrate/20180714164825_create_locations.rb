class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :county
      t.string :country

      t.timestamps null: false
    end
  end
end
