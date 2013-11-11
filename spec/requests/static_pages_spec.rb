require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "It should have the content Welcome to the SJSU Textbooks" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      expect(page).to have_content('SJSU')
  end
end
describe "About Us" do
    it "It should have the content About " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit about_path
      expect(page).to have_content('About')
  end
end

describe "Contact" do
    it "It should have the content Contact" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit contact_path
      expect(page).to have_content('Contact')
  end
end
     describe "Help page" do
		it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end
  end
end
