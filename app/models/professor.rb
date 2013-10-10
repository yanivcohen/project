class Professor < ActiveRecord::Base
	validates :firstname, presence: true 

	def self.search(search)
  if search
    find(:all, :conditions => ['firstname LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end
	

end
