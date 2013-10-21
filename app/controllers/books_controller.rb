class BooksController < ApplicationController

def index
  #params[:search].present? ? @books = Book.search(params[:search]) : @books = Book.all
  @books = Book.all
end



def new
  @book=Book.new
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



def show
@book=Book.find(params[:id])
#@ratings = @professor.ratings.paginate(page: params[:page]) # this is new
#@rating = @professor.ratings.build
end


private

def book_params
  params.require(:book).permit(:title, :edition, :author,:isbn)
end
end




