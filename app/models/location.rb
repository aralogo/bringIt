class Location < ActiveRecord::Base
    has_one :match_origin, :class_name => "Match", :foreign_key => 'origin_id'
    has_one :match_destiny, :class_name => "Match", :foreign_key => 'destiny_id'
    has_one :Journey_origin, :class_name => "Journey", :foreign_key => 'origin_id'
    has_one :Journey_destiny, :class_name => "Journey", :foreign_key => 'destiny_id'
    has_one :Journey_intermediate1, :class_name => "Journey", :foreign_key => 'intermediate1_id'
    has_one :Journey_intermediate2, :class_name => "Journey", :foreign_key => 'intermediate2_id'
    has_one :Journey_intermediate3, :class_name => "Journey", :foreign_key => 'intermediate3_id'
    
    validates :address1, :city, :county, :country, presence: true
end
