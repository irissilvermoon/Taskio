require 'spec_helper'

feature "Creating Tasks" do
  scenario "create a task" do
    visit '/tasks'
    click_link "New Task"
    fill_in "Title", with: "Clean the house"
   # fill_in "Description", with: "Upstairs cleaning"
    # fill_in "Priority", :with => 2
    click_button "Create Task"
    page.should have_content("Your task has been created.")
  end
end
