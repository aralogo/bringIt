class Journey < ActiveRecord::Base
  belongs_to :origin, :class_name => "Location", dependent: :destroy, required: true
  belongs_to :intermediate1, :class_name => "Location", dependent: :destroy
  belongs_to :intermediate2, :class_name => "Location", dependent: :destroy
  belongs_to :intermediate3, :class_name => "Location", dependent: :destroy
  belongs_to :destiny, :class_name => "Location", dependent: :destroy, required: true
  belongs_to :user, :class_name => "User"
  has_many :matches
  
  validates :originTime, :destinyTime, :driverID_id, :priceTotal, presence: true
  validates :priceTotal, numericality: true
  
   accepts_nested_attributes_for :origin, allow_destroy: true
   accepts_nested_attributes_for :intermediate1, allow_destroy: true
   accepts_nested_attributes_for :intermediate2, allow_destroy: true
   accepts_nested_attributes_for :intermediate3, allow_destroy: true
   accepts_nested_attributes_for :destiny, allow_destroy: true
end
