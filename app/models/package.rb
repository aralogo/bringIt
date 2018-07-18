class Package < ActiveRecord::Base
  belongs_to :category, :class_name => "Category"
  belongs_to :user, :class_name => "User"
  has_many :LocationLog
  has_one :Match
  
  
  validates :category_id, presence: true
end
