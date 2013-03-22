require "spec_helper"

feature "creating groups" do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link "Create Group"
  end

  scenario "user can create a group" do
    fill_in "Name", with: "My awesome team!"
    click_button "Create Group"
    page.should have_content "Your group has been created."
  end
end
