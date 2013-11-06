class CopiesController < ApplicationController
  before_action :signed_in_user


  def create
    @book = Book.find(copy_params[:book_id])
    @copy = @book.copies.build(copy_params) #find out how to refer to current professor
    if @copy.save
      flash[:success] = "Book saved."
      redirect_to @book #may want to go somewhere else
    else
      render 'static_pages/home' #may want to go somewhere else
    end
  end


  def update
    @copy = Rating.find(params[:id])
    @book = Book.find(@copy.book_id)
    if @copy.update_attributes(value: params[:value])
      respond_to do |format|
        format.js
      end
    end
  end


  def destroy
  end


  def copy_params
    params.require(:copy).permit( :price, :condition, :book_id,:seller)
  end

end

