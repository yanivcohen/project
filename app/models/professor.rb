class Professor < ActiveRecord::Base
	validates :firstname, presence: true 

  searchable do
    text :comments
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
