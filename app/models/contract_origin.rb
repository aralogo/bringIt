class ContractOrigin < ActiveRecord::Base
  belongs_to :matchID, :class_name => "Match"
  has_one :DeliveryOrder
  
  validates :matchID, :isSigned_Driver, :isSigned_Sender, :origin_date, presence: true
  validates :isSigned_Driver, :isSigned_Receiver, accacceptance: {:accept => true }
end
