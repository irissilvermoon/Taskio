class RenameGroupsToTaskLists < ActiveRecord::Migration
  def up
    rename_table :groups, :task_lists
  end

  def down
    rename_table :task_lists, :groups
  end
end
