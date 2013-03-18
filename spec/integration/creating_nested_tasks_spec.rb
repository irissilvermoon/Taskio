require 'spec_helper'

feature "Creating Nested Tasks" do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/tasks'
    click_link "New Task"
    fill_in "Title", :with => "Clean the House"
    fill_in "Description", :with => "let's get this house clean"
    click_button "Create Task"
  end

  scenario "create a nested task" do
    click_link "Subtask"
    fill_in "Title", with: "Clean the bathroom"
    fill_in "Description", :with => "Gross!"
    click_button "Create Task"
    page.should have_content("Your task has been created.")
  end

  # scenario "nested tasks display on show" do
  #   fill_in "Title", with: "Clean the kitchen"
  #   click_button "Create Task"
  #   visit '/tasks'
  #   click_link "Clean the house"
  #   page.should have_content("Clean the kitchen")
  # end


  scenario "users can't create an empty task" do
    click_link "Subtask"
    fill_in "Title", :with => ""
    click_button "Create Task"
    page.should have_content("Your task was not created.")
  end
end
