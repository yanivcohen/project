require 'spec_helper'

describe User do
  

  before do 
  	 @user = User.new(name: "User", email: "user@gmail.com") 
  end
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

end