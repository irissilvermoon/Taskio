class TaskListMembership < ActiveRecord::Base
  attr_accessible :created_at, :created_by
  belongs_to :user
  belongs_to :task_list
end
