class Task < ActiveRecord::Base
  attr_accessible :created_at, :description, :priority,
                  :title, :parent_id
  validates :title, presence: true
end
