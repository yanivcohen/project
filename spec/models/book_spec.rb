require 'spec_helper'

describe Book do
  
  before do 
  	 @book = Book.new(title: "Title", edition: "1", author: "Author", isbn: "isbn") 
  end
  subject { @book}

  it { should respond_to(:name) }
  it { should respond_to(:email) }
end
