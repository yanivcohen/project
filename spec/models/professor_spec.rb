require 'spec_helper'

describe Professor do
  pending "add some examples to (or delete) #{__FILE__}"

  before { @professor = Professor.new(firstname: "Joe", lastname: "Black", department: "CS") }
  subject { @professor }

  it {should respond_to(:firstname) }
  it {should respond_to(:lastname) }
  it {should respond_to(:department) }

  it {should be_valid }

  describe "when first name is not present" do
    before { @professor.firstname = " " }
    it {should_not be_valid }
  end
  describe "when last name is not present" do
    before { @professor.lastname = " " }
    it { should_not be_valid }
  end
  describe "when department is not present" do
    before { @professor.department = " " }
    it {should_not be valid }
  end
  
end
