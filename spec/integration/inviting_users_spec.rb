require 'spec_helper'

feature 'inviting users' do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link 'Invite User'
  end

  scenario 'User can invite another user' do
    fill_in "Email", :with => "newuser@taskio.com"
    click_button "Send an invitation"
    page.should have_content ("New user has been invited!")
  end

  scenario 'Users can sign up via invite' do
    fill_in "Email", :with => "newuser@taskio.com"
    click_button "Send an invitation"
    click_link "Sign out"
    open_email "newuser@taskio.com", :with_subject => "You've been invited to Taskio!"
    User.first.confirmation_token
    current_email.body
    click_email_link_matching(/invitation/)
    page.should have_content("Set your password")
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Set my password"
    page.should have_content("Welcome to Taskio! You are now signed in!")
    page.should have_content("Signed in as newuser@taskio.com")
  end
end