class YcUser < ActiveRecord::Base
	validates :name, presence: true
end
