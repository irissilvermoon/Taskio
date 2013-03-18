class Group < ActiveRecord::Base
  attr_accessible :creator_id, :name
  validates :name, :presence => true
  has_many :users, :through => :group_memberships
end
