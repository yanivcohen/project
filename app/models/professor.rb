class Professor < ActiveRecord::Base

  has_many :ratings

  validates :firstname, presence: true 
  validates_associated :ratings
  searchable do
    
    text :firstname
    
end

	

	#def self.search(search)
  #if search
    #find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  #else
    #find(:all)
  #end
#end
	

end
