class BooksController < ApplicationController

def index
  params[:search].present? ? @books = Book.search(params[:search]) : @books = Book.all
  #@books = Book.all
end



def new
  @book=Book.new
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
    myparams={price: params[:price].values[0], condition: params[:condition].values[0], seller: params[:seller].values[0]}
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





