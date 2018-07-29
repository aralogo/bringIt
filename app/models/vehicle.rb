class Vehicle < ActiveRecord::Base
  belongs_to :User
  
  validates :numberPlate, :model, :brand, presence: true
  validates :numberPlate , uniqueness: true
end
