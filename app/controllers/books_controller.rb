class BooksController < ApplicationController

  def new
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
    #@ratings = @professor.ratings.paginate(page: params[:page]) # this is new
    #@rating = @professor.ratings.build
  end


  def create
      @book=Book.new(book_params)
      if @book.save
        flash[:success] = "Book saved successfully"
        redirect_to books_new_path
      else
        render 'new'
      end

    end

   # def index
      #params[:search].present? ? @professors = Professor.search(params[:search]) : @professors = Professor.all
    #end



    private

    def book_params
      params.require(:book).permit(:title, :edition, :author,:isbn)
    end


  end






