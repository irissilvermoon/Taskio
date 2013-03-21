class Refactoring < ActiveRecord::Migration
  def up
    remove_column :task_lists, :creator_id
    rename_table :task_lists, :group

    remove_column :task_list_memberships, :created_by
    remove_column :task_list_memberships, :created_at
    rename_table :task_list_memberships, :membership

    remove_column :tasks, :user_id
  end

  def down
    add_column :tasks_list, :creator_id
    rename_table :group, :tasks_list

    add_column :task_list_memberships, :created_by
    add_column :task_list_memberships, :created_at
    rename_table :membership, :task_list_memberships

    add_column :tasks, :user_id
  end
end
