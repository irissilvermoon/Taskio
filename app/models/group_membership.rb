class GroupMembership < ActiveRecord::Base
  attr_accessible :created_at, :created_by, :group_id, :user_id
  belongs_to :user
  belongs_to :group
end
