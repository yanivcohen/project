namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    
    99.times do |n|
        name  = Faker::Name.name
        email = "example-#{n+1}@gmail.com"
        password  = "password"
        User.create!(name: name,
        email: email,
        password: password,
        password_confirmation: password)
        end
                                                                
      99.times do |n|
      title = Faker::Name.name
      edition= Random.rand(42-10) + 10
      author  = Faker::Name.name
      isbn = Random.rand(42-10) + 10
      Book.create!(title: title,
                   edition: edition,
                   author: author,
                   isbn: isbn )
      end
      books = Book.all(limit: 6)
      50.times do |n|
      price=Random.rand(42-10) + 10
      condition = "good"
      seller= "example-#{n+1}@gmail.com"
      books.each { |book| book.copies.create!(price: price, condition: condition, seller: seller) }
    end 
    
  end
end