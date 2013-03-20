require 'spec_helper'

describe Task do
  describe "ancestry" do

    it "should be able to create a new subtask" do
      task = Factory(:task)
      subtask = task.children.create(:title => "Title", :description => "a description")
      task.children.should include(subtask)
    end
  end
end
