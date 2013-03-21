require "spec_helper"

feature "viewing subtasks" do

  let!(:user)  { Factory(:confirmed_user) }
  let!(:task) { Factory(:task, :title => "House Cleaning") }
  let!(:subtask) { Factory(:subtask, task: task,
      title: "bathroom cleaning", description: "use elbow grease!") }

  before do
    sign_in_as!(user)
    visit '/tasks'
  end

  scenario "view a subtask from a task" do
    click_link task.title
    click_link subtask.title
    page.should have_content(subtask.description)
  end

  scenario "view a subtask from index" do
    click_link subtask.title
    page.should have_content(subtask.description)
  end
end
