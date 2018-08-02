class DeliveryOrder < ActiveRecord::Base
  belongs_to :match, :class_name => "ContractOrigin"
  
  validates :isSigned_Driver, :isSigned_Receiver, :destiny_date, presence: true
  validates :isSigned_Driver, :isSigned_Receiver, acceptance: {:accept => true }
end
