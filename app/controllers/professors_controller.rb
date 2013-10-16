class ProfessorsController < ApplicationController
  
  def new
    @professor=Professor.new
  end
  

 	
  def create
    @professor=Professor.new(professor_params)
    if @professor.save
      flash[:success] = "Professor saved successfuly"
      redirect_to new_professor_path
    else
      render 'new'
    end	

  end 

  def index
     #if params[:query].present?
      #@professors = Professor.search(params[:query])
      #@professors = Professor.all 
    #else
    @professors=Professor.search(params[:search])
    #@professors = Professor.all
  #end
  end


  

  def show
    @professor=Professor.find(params[:id])
    @ratings = @professor.ratings.paginate(page: params[:page]) # this is new
    @rating = @professor.ratings.build

  end
  

  private

    def professor_params
      params.require(:professor).permit(:firstname, :lastname, :department)
    end
      

end
