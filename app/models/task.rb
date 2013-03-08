class Task < ActiveRecord::Base
  attr_accessible :created_at, :description, :priority, :title
end
