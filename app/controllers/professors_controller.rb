class ProfessorsController < ApplicationController
  def new
  	@new_professor=Professor.new
  end
  

  def index
 @search = Professor.search do
    fulltext params[:search]
 end
 @matchProfessor = @search.results
 end 

  def show
  end
end
