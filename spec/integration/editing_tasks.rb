require "spec_helper"

feature "Editing Tasks" do
  before do
    sign_in_as!(Factory(:confirmed_user))
    Factory(:task, title: "House Cleaning")
    visit '/'
    # click_link "House Cleaning"
    click_link "Edit"
  end
  scenario "edit a task" do
    fill_in "Title", with: "Bathroom Cleaning"
    click_button "Update Task"
    page.should have_content("Your task has been updated.")
  end

  scenario "edit a task with invalid information" do
    fill_in "Title", with: ""
    click_button "Update Task"
    page.should have_content("Your task was not updated.")
  end
end
