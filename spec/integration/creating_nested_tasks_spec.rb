# require 'spec_helper'

# feature "Creating Nested Tasks" do

#   before do
#     Factory(:task, title: "Clean the house")
#     visit '/tasks'
#     click_link "Subtask"
#   end

#   scenario "create a nested task" do
#     fill_in "Title", with: "Clean the bathroom"
#     click_button "Create Task"
#     page.should have_content("Your task has been created.")
#   end

#   # scenario "nested tasks display on show" do
#   #   fill_in "Title", with: "Clean the kitchen"
#   #   click_button "Create Task"
#   #   visit '/tasks'
#   #   click_link "Clean the house"
#   #   page.should have_content("Clean the kitchen")
#   # end


#   scenario "don't create an empty task" do
#   click_button "Create Task"
#   page.should have_content("Your task was not created.")
#   end

# end
