class Professor < ActiveRecord::Base

  has_many :ratings, dependent: :destroy

#include Tire::Model::Search
#include Tire::Model::Callbacks
  def self.search(search)
    if search
      find(:all, :conditions => ['firstname LIKE ? OR lastname LIKE ? OR department LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end

  #validates_associated: ratings




end

