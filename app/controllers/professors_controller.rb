class ProfessorsController < ApplicationController
  
  def new
  	@professor=Professor.new
  end
  
 	def create
  	  @professors=Professor.new(params[ professor_params])
    	if @professors.save
    	    flash[:success] = "Professor saved successfuly"
          redirect_to new_professor_path
    	else
      		render 'new'
    	end	
  end 

  def index
 	@search = Professor.search do
    fulltext params[:search]
  end
   @matchProfessor = @search.results
  end 

  

  def show
  end
  

  private
 	def professor_params
      params.require(:professor).permit(:firstname, :lastname, :department)
 	end


end
