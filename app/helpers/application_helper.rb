module ApplicationHelper

  require 'matrix' #used to perform content-based recommendations
  require 'yaml'

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "SJSU Books Exchange "
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Content-Based Recommendation Engine
  def recommend
    top5num = [0,0,0,0,0] #top five array
    top5book = [nil,nil,nil,nil,nil]

    #create the user profile
    arr = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] #may need to resize dimension count
    userVector =  Vector.elements(arr, copy = true)

    Order.where(user_id: current_user.id).each do |order|
      book = Book.find(Copy.find(order.copy_id).book_id)
      bookVector = book.vector
      userVector = userVector + bookVector
    end
    
    Book.all.find_each do |book|
      bookVector = book.vector
      sim = bookVector.r
      sim = bookVector.normalize.inner_product userVector.normalize if sim != 0
      # if this option is better than the others, add it to the array
      if sim > top5num.min
        top5book[top5num.index(top5num.min)] = book
        top5num[top5num.index(top5num.min)] = sim
      end
    end    
    # now send the results on their way...
    @topPicks = top5book
    
  end


end
