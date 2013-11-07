require 'matrix'
class Book < ActiveRecord::Base
  has_many :copies, dependent: :destroy
  attr_accessor :vector
 # serialize :book_vector

  after_find do |book|
    book.vector = YAML::load(book.book_vector)
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end


end
