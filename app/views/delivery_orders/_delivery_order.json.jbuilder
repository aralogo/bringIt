json.extract! delivery_order, :id, :matchID_id, :isSigned_Driver, :isSigned_Receiver, :destiny_date, :comment, :created_at, :updated_at
json.url delivery_order_url(delivery_order, format: :json)
