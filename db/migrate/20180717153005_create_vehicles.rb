class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :numberPlate
      t.references :driverID, index: true, foreign_key: true
      t.string :model
      t.string :brand
      t.boolean :isFull
      t.integer :packagesCat1
      t.integer :packagesCat2
      t.integer :packagesCat3

      t.timestamps null: false
    end
  end
end
