class ProfessorsController < ApplicationController
  
  def new
    @professor=Professor.new
  end
  

 	
  def create
    @professor=Professor.new(professor_params)
    if @professor.save
      flash[:success] = "Professor saved successfuly"
      redirect_to professors_path # used to be new_professor_path
    else
      render 'new'
    end	

  end 

  def index
    if params[:search].present?
      @professors = Professor.search(params[:search])
    else
      @professors = Professor.all
    end
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
