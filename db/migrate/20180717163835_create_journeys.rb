class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.references :origin, index: true, foreign_key: true
      t.references :intermediate1, index: true, foreign_key: true
      t.references :intermediate2, index: true, foreign_key: true
      t.references :intermediate3, index: true, foreign_key: true
      t.references :destiny, index: true, foreign_key: true
      t.datetime :originTime
      t.datetime :destinyTime
      t.references :driverID, index: true, foreign_key: true
      t.decimal :priceTotal
      t.decimal :price01 
      t.decimal :price12
      t.decimal :price23

      t.timestamps null: false
    end
  end
end
