class Package < ActiveRecord::Base
  belongs_to :category, :class_name => "Category"
  belongs_to :user, :class_name => "User"
  has_many :locationLogs
  has_one :match
  
  
  validates :category_id, presence: true
  validates :acceptPolicy, acceptance: {:accept => true }
end
