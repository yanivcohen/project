require 'matrix'
class Book < ActiveRecord::Base
  has_many :copies, dependent: :destroy
  attr_accessor :vector
 # serialize :book_vector

  after_find do |book|

    if book.book_vector?
      book.vector = YAML::load(book.book_vector)
    else
      arr = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      book.vector = Vector.elements(arr, copy = true)
    end
  end
  accepts_nested_attributes_for  :copies
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ? OR author LIKE ? OR isbn LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end


end
