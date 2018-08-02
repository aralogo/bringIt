class LocationLog < ActiveRecord::Base
    belongs_to :packageID_id, :class_name => "Package"
    
    validates :latitude, :longitude, :position_time, presence: true
end
