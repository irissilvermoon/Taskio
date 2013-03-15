require 'spec_helper'

feature "Creating Tasks" do

  before do
    Factory(:task, :title => "House Cleaning")
    user = Factory(:user, :email => "example@taskio.com")
    user.confirm!

    visit '/'
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    fill_in "Email", :with => "example@taskio.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
    page.should have_content("New Task")
    click_link "New Task"
  end

  scenario "create a task" do
    fill_in "Title", with: "Clean the house"
    fill_in "Description", with: "Upstairs cleaning"
    click_button "Create Task"
    page.should have_content("Your task has been created.")
    within("#task #author") do
      page.should have_content("Created by example@taskio.com")
    end
  end

  scenario "don't create an empty task" do
  click_button "Create Task"
  page.should have_content("Your task was not created.")
  page.should have_content("Title can't be blank")
  end
end
