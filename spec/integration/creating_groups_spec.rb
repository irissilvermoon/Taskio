require 'spec_helper'

feature 'creating groups' do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link "Create Group"
  end

  scenario "creating a group with valid parameters" do
    fill_in 'Name', :with => "My New Group"
    click_button 'Create Group'
    page.should have_content("Group has been created.")
  end

  scenario "creating a group with invalid parameters" do
    fill_in "Name", :with => ''
    click_button 'Create Group'
    page.should have_content("Group has not been created.")
  end
end