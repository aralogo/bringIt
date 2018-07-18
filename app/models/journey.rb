class Journey < ActiveRecord::Base
  belongs_to :origin, :class_name => "Location"
  belongs_to :intermediate1, :class_name => "Location"
  belongs_to :intermediate2, :class_name => "Location"
  belongs_to :intermediate3, :class_name => "Location"
  belongs_to :destiny, :class_name => "Location"
  belongs_to :driverID, :class_name => "User"
  has_many :Match
  
  validates :origin, :destiny, :originTime, :destinyTime, :driverID, :priceTotal, presence: true
end
