class Match < ActiveRecord::Base
  belongs_to :journeyID, :class_name => "Journey"
  belongs_to :origin, :class_name => "Location"
  belongs_to :destiny, :class_name => "Location"
  belongs_to :packageID, :class_name => "Package"
  has_one :ContractOrigin
  
  validates :journeyID, :origin, :destiny, :originTime, :destinyTime, :packageID, :acceptTime, :price, presence: true
end
