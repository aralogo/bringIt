class DeliveryOrder < ActiveRecord::Base
  belongs_to :match, :class_name => "ContractOrigin"
  
  validates :matchID_id, :isSigned_Driver, :isSigned_Receiver, :destiny_date, :comment, presence: true
  validates :isSigned_Driver, :isSigned_Receiver, acceptance: {:accept => true }
end
