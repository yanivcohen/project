class RatingsController < ApplicationController

  def create
    @professor = Professor.find(rating_params[:professor_id])
    @rating = @professor.ratings.build(rating_params) #find out how to refer to current professor
    if @rating.save
      flash[:success] = "Rating saved."
      redirect_to @professor #may want to go somewhere else
    else
      render 'static_pages/home' #may want to go somewhere else
    end
  end


  def update
    @rating = Rating.find(params[:id])
    @professor = Professor.find(@rating.professor_id)
    if @rating.update_attributes(value: params[:value])
      respond_to do |format|
        format.js
      end
    end
  end


  def destroy
  end

  private
    
    def rating_params
      params.require(:rating).permit(:professor_id, :value, :comment)
    end

end
