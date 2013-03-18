require "spec_helper"

feature "deleting subtasks" do
  let!(:user)  { Factory(:confirmed_user) }
  let!(:task) { Factory(:task, :title => "House Cleaning") }
  let!(:subtask) { Factory(:subtask, task: task,
      title: "bathroom cleaning", description: "use elbow grease!") }

  before do
    sign_in_as!(user)
    visit '/'
  end

  scenario "deleting a subtask" do
  click_link task.title
    click_link subtask.title
    click_link "Delete"
    page.should have_content("Your subtask has been deleted.")
  end

end
