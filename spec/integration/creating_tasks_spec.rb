require 'spec_helper'

feature "Creating Tasks" do

  before do
    Factory(:task_list, :name => "House Cleaning")
    user = Factory(:user, :email => "example@taskio.com")
    user.confirm!

    visit '/'
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    fill_in "Email", :with => "example@taskio.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
    page.should have_content("Create Task List")
    click_link("Create Task List")
  end

  scenario "create a task" do
    fill_in "Name", :with => "New Task to do!"
    click_button "Create Task list"
    page.should have_content("New Task to do!")

    click_link("New Task to do!")
    page.should have_content("Listing tasks")

    click_link "New Task"
    fill_in "Title", with: "Clean the house"
    fill_in "Description", with: "Upstairs cleaning"

    click_button "Create Task"
    page.should have_content("Your task has been created.")
    click_link "Clean the house"
    within("#task #author") do
      page.should have_content("Created by example@taskio.com")
    end
  end

  scenario "don't create an empty task" do
    fill_in "Name", :with => "Household cleaning"
    click_button "Create Task list"
    page.should have_content("Household cleaning")

    click_link("Household cleaning")
    page.should have_content("Listing tasks")

    click_link "New Task"
    click_button "Create Task"
    page.should have_content("Your task was not created.")
  end
end
