class TaskList < ActiveRecord::Base
  attr_accessible  :name
  validates :name, :presence => true
  has_many :task_list_memberships
  has_many :users, :through => :task_list_memberships, :inverse_of => :task_lists
  has_many :tasks
end
