class ChangeTaskListMembershipForeignKey < ActiveRecord::Migration
  def change
    rename_column :task_list_memberships, :group_id, :task_list_id
  end
end
