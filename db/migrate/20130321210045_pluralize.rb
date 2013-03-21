class Pluralize < ActiveRecord::Migration
  def up
    rename_table :group, :groups
    rename_table :membership, :memberships
  end

  def down
    rename_table :groups, :group
    rename_table :memberships, :membership
  end
end
