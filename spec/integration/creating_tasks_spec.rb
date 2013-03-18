require 'spec_helper'

feature "Creating Tasks" do

  let!(:task) { Factory(:task, :title => "House Cleaning") }

  before do
    user = Factory(:user, :email => "example@taskio.com")
    user.confirm!

    visit '/'
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    sign_in_as!(user)
    page.should have_content(task.title)
    page.should have_content("New Task")
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
