class DeliveryOrder < ActiveRecord::Base
  belongs_to :matchID, :class_name => "ContractOrigin"
  
  validates :matchID, :isSigned_Driver, :isSigned_Receiver, :destiny_date, presence: true
end
