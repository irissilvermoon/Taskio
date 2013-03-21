require "spec_helper"

feature "Creating Subtasks" do
  before do
      Factory(:task, :title => "House Cleaning")
      user = Factory(:confirmed_user)
      sign_in_as!(user)
      visit '/tasks'
    end
  scenario "create a subtask" do
      click_link "Create Subtask"
      fill_in "Title", with: "Clean the bathroom"
      fill_in "Description", with: "really scrub it!"
      click_button "Create Subtask"
      page.should have_content("Subtask has been created.")
      visit '/tasks'
      page.should have_content("Clean the bathroom")
  end

  scenario "don't create a subtask without a title" do
      click_link "Create Subtask"
      click_button "Create Subtask"
      page.should have_content("Subtask has not been created.")
      page.should have_content("Title can't be blank")
  end

end
