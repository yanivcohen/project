class ProfessorsController < ApplicationController
  def new

  end
  

  def index
  	@professor = Professor.search(params[:search])
 end 

  def show
  end
end
