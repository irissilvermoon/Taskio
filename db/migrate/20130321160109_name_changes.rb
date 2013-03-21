class NameChanges < ActiveRecord::Migration
  def up
    remove_column :membership, :task_list_id
    add_column :membership, :group_id, :integer
  end

  def down
    add_column :membership, :task_list_id, :integer
    remove_column :membership, :group_id
  end
end
