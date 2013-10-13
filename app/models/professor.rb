class Professor < ActiveRecord::Base

  has_many :ratings, dependent: :destroy

include Tire::Model::Search
include Tire::Model::Callbacks



  #validates_associated: ratings



	

end
