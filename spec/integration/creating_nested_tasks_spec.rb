require 'spec_helper'

feature "Creating Nested Tasks" do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link "Create Task List"
    fill_in 'Name', :with => "My New Task list"
    click_button 'Create Task list'
    click_link "My New Task list"

    click_link "New Task"
    fill_in "Title", with: "Clean the house"
    fill_in "Description", with: "Upstairs cleaning"

    click_button "Create Task"
    page.should have_content("Your task has been created.")
    click_link "Clean the house"
  end

  scenario "create a nested task" do
    click_link "Subtask"
    fill_in "Title", with: "Clean the bathroom"
    fill_in "Description", :with => "Gross!"
    click_button "Create Task"
    page.should have_content("Your task has been created.")
  end

  scenario "users can't create an empty task" do
    click_link "Subtask"
    fill_in "Title", :with => ""
    click_button "Create Task"
    page.should have_content("Your task was not created.")
  end
end
