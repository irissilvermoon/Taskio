require 'spec_helper'

feature "Creating Tasks" do

  before do
    visit '/tasks'
    click_link "New Task"
  end

  scenario "create a task" do
    fill_in "Title", with: "Clean the house"
    click_button "Create Task"
    page.should have_content("Your task has been created.")
  end

  scenario "don't create an empty task" do
  click_button "Create Task"
  page.should have_content("Your task was not created.")
  page.should have_content("Title can't be blank")
  end

end
