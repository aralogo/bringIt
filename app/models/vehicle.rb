class Vehicle < ActiveRecord::Base
  belongs_to :driverID_id, :class_name => "User"
  
  validates :numberPlate, :model, :brand, presence: true
  validates :numberPlate , uniqueness: true
end
