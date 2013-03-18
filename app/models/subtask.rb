class Subtask < ActiveRecord::Base
  belongs_to :task
  attr_accessible :created_at, :description, :priority, :title
  validates :title, presence: true
end
