require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :title => "Title",
        :description => "MyText",
        :priority => 1
      ),
      stub_model(Task,
        :title => "Title",
        :description => "MyText",
        :priority => 1
      )
    ])
  end
end
