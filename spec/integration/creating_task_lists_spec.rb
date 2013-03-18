require 'spec_helper'

feature 'creating task lists' do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link "Create Task List"
  end

  scenario "creating a task list with valid parameters" do
    fill_in 'Name', :with => "My New Task list"
    click_button 'Create Task list'
    page.should have_content("Task list has been created.")
  end

  scenario "creating a task list with invalid parameters" do
    fill_in "Name", :with => ''
    click_button 'Create Task list'
    page.should have_content("Task list has not been created.")
  end
end