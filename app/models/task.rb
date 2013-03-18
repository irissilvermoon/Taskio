class Task < ActiveRecord::Base
  attr_accessible :created_at, :description, :priority,
                  :title, :parent_id
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user
  belongs_to :task_list
  has_ancestry
end
