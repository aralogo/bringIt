class BankAccount < ActiveRecord::Base
  belongs_to :user, :class_name => "User"
  
  validates :ISBN, :accountHolder, presence: true
  validates :ISBN, uniqueness: true
end
