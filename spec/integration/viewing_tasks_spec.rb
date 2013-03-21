require 'spec_helper'

feature "Viewing Tasks" do

  before do
    Factory(:task, :title => "House Cleaning")
    user = Factory(:confirmed_user, :email => "example@taskio.com")
    sign_in_as!(user)
    visit '/tasks'
  end

  scenario "Should see a task after sign in" do
     page.should have_content("Listing tasks")
     page.should have_content("House Cleaning")
  end

end
