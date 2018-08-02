class ContractOrigin < ActiveRecord::Base
  belongs_to :match, :class_name => "Match"
  has_one :deliveryOrder
  
  validates :isSigned_Driver, :isSigned_Sender, :origin_date, presence: true
  validates :isSigned_Driver, :isSigned_Receiver, acceptance: {:accept => true }
end
