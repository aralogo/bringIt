class Review < ActiveRecord::Base
  belongs_to :reviewOn, :class_name => "User"
  belongs_to :reviewBy, :class_name => "User"
  
  
  validates :comment, presence: true
  validates :comment, length: {maximum: 500}
end
