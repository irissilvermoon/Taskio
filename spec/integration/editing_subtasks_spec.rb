require "spec_helper"

feature "editing subtasks" do

  let!(:user)  { Factory(:confirmed_user) }
  let!(:task) { Factory(:task, :title => "House Cleaning") }
  let!(:subtask) { Factory(:subtask, task: task,
      title: "bathroom cleaning", description: "use elbow grease!") }

  before do
    sign_in_as!(user)
    visit '/'
  end

  scenario "edit a subtask" do
    click_link task.title
    click_link subtask.title
    click_link "Edit"
    fill_in "Title", with: "gardening"
    click_button "Update Subtask"
    page.should have_content "Subtask has been updated."
    page.should have_content "gardening"
  end

  scenario "don't edit a subtask with bad data" do
    click_link task.title
    click_link subtask.title
    click_link "Edit"
    fill_in "Title", with: ""
    click_button "Update Subtask"
    page.should have_content "Subtask has not been updated."
  end
end
