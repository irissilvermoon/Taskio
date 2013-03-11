class Task < ActiveRecord::Base
  attr_accessible :created_at, :description, :priority, :title
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user
end
