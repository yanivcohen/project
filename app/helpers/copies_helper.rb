module CopiesHelper

  def copy_params
    params.require(:copy).permit( :price, :condition, :book_id,:seller)
  end

end
