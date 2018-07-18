class AddDetailsToLocationLogs < ActiveRecord::Migration
  def change
    add_reference :location_logs, :packageID, index: true, foreign_key: true
  end
end
