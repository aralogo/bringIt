class Vehicle < ActiveRecord::Base
  belongs_to :user, :class_name => "User"
  
  validates :numberPlate, :model, :brand, presence: true
  validates :numberPlate, uniqueness: true
end
