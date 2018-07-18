class BankAccount < ActiveRecord::Base
  belongs_to :userID, :class_name => "User"
  
  validates :ISBN, :accountHolder, presence: true
end
