class Match < ActiveRecord::Base
  belongs_to :journey, :class_name => "Journey"
  belongs_to :origin, :class_name => "Location"
  belongs_to :destiny, :class_name => "Location"
  belongs_to :packageID, :class_name => "Package", dependent: :destroy
  has_one :contractOrigin
  
  validates :journeyID_id, :originTime, :destinyTime, :packageID_id, :acceptTime, :price, presence: true
end
