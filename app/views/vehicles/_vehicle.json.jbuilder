json.extract! vehicle, :id, :numberPlate, :driverID_id, :model, :brand, :isFull, :packagesCat1, :packagesCat2, :packagesCat3, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
