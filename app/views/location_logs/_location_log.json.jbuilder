json.extract! location_log, :id, :latitude, :longitude, :position_time, :created_at, :updated_at
json.url location_log_url(location_log, format: :json)
