require 'spec_helper'

feature "Creating Tasks" do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/tasks'
    click_link "New Task"
  end

  scenario "create a task" do
    fill_in "Title", with: "Clean the house"
    fill_in "Description", with: "Upstairs cleaning"
    click_button "Create Task"
    page.should have_content("Your task has been created.")
  end

  scenario "don't create an empty task" do
  click_button "Create Task"
  page.should have_content("Your task was not created.")
  page.should have_content("Title can't be blank")
  end
end
