require 'googlebooks'

class BooksController < ApplicationController
  before_action :signed_in_user, only: [:create, :new]
def index
  params[:search].present? ? @books = Book.search(params[:search]) : @books = Book.all
  #@books = Book.all
end
def new
  @book=Book.new

  name = params[:search]
  books = GoogleBooks.search("isbn: #{name}")
  first_book = books.first
   
  if !first_book.nil?
   @title = first_book.title
   @author = first_book.authors
   @isbn = first_book.isbn_10
   @publisher = first_book.publisher
   @date = first_book.published_date
   @pages = first_book.page_count.to_s
   @cover = first_book.image_link(:zoom => 1)
  else 
   @message = "empty"
  end
end

def create
  logger.debug book_params
  book_params.inspect
  @book=Book.new(book_params)
#  @copy=Copy.new #dummy copy
  if @book.save
    flash[:success] = "Book saved successfully"
    params.inspect
#    myparams=copy_params()
    myparams={price: params[:price].values[0], condition: params[:condition].values[0], seller: params[:seller].values[0], user_id: current_user.id}
    logger.debug "========================================="
    logger.debug myparams
    logger.debug "========================================="
    @book.copies.build myparams
    @book.save
    redirect_to books_new_path
  else
    render 'new'
  end

end
def copy_params
    params.require(:copy).permit( :price, :condition, :book_id,:seller)
  end
def show
@book=Book.find(params[:id])
@copies = @book.copies.paginate(page: params[:page])
@copy=@book.copies.build
end

private

def book_params
  params.require(:book).permit(:title, :edition, :author,:isbn)
end
end





