class CreateLocationLogs < ActiveRecord::Migration
  def change
    create_table :location_logs do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.datetime :position_time

      t.timestamps null: false
    end
  end
end
