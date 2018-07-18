class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :journeyID, index: true, foreign_key: true
      t.references :origin, index: true, foreign_key: true
      t.references :destiny, index: true, foreign_key: true
      t.datetime :originTime
      t.datetime :destinyTime
      t.references :packageID, index: true, foreign_key: true
      t.datetime :acceptTime
      t.decimal :price

      t.timestamps null: false
    end
  end
end
