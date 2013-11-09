##### "Product Domain" Variant

#Get list of books user has bought

#Reduce books to categories,

#Recommend books from highest ranking category

##### Collaborative Filtering


#Get list of books user has purchased
#Get list of other users that have bought those books
#Score other users based on number of books that are similar
#Get list of books from those other users that original user does not have.
#Add the score for each book (supplied by the user score).
#Top 5 get used

#This technique runs in O(n*m) time




##### Vector variant (assumes alteration of the both vectors at time of purchase)
require 'matrix'
#Given @currentUser
#userVector = @currentUser.uservector
#create topFive array

#create vector userProfile
#foreach book user has bought
  #userProfile vector += vector

#foreach book
  #check to see that the user has not already purchased this book
  #if he has not
    #bookVector = tempBook.bookVector
    #bookScore = userVector.inner_product bookVector
    #if the bookScore > min(topFive), replace the min(topFive)

#after this, use the topFive array as the recommendations going forward

#Algorithm will work in O(n) time


###Upon book purchase:

#userVector += factor_of bookVector
#bookVector += other_factor_of userVector

#Where a vector will be defined as categories:
#example <Engineering, Computers, Art, History, Science, Business, Education, English, Foreign Language>
  #the more dimensions and the more orthogonal those dimensions, the more accurate the technique should be.




#example of vector usage
#
#2.0.0p247 :014 > v1 =  Vector.elements(arr1, copy = true)
# => Vector[4, 7, 3, 5, 9] 
#2.0.0p247 :015 > v2 =  Vector.elements(arr2, copy = true)
# => Vector[1, 2, 3, 4, 5] 
#2.0.0p247 :016 > v1.inner_product v2
# => 92 

