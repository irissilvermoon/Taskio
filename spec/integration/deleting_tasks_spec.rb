require "spec_helper"

feature "deleting tasks" do
  before do
    sign_in_as!(Factory(:confirmed_user))
    Factory(:task, title: "House Cleaning")
  end

  scenario "deleting a task" do
    visit '/'
    click_link "Delete"
    page.should have_content("Your task has been deleted.")
  end

end
