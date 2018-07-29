class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :BankAccount
  has_many :Package
  has_many :reviewby, :class_name => "Review"
  has_many :reviewOn, :class_name => "Review"
  has_many :Journey
  has_one :Vehicle
  
  
  validates :email, :name,:surname, :DOB, :phone, presence: true
  validates :email, length:{maximum:140}
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "email must include @ and ."}
  # validates :password, length: {in: 6..20}
  # validates :phone, numericality: {only_integer: true}
  validates :email , uniqueness: true
end
