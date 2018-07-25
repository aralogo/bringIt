class Category < ActiveRecord::Base
    has_many :Package
    
    validates :max_length, :max_width, :max_height, :max_weight, presence: true
    validates :max_length, :max_width, :max_height, :max_weight, numericality: true
end
