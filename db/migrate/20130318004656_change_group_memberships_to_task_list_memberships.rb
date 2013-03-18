class ChangeGroupMembershipsToTaskListMemberships < ActiveRecord::Migration
  def change
    rename_table :group_memberships, :task_list_memberships
  end
end
