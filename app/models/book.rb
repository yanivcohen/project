class Book < ActiveRecord::Base
  has_many :copies, dependent: :destroy
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end


end
