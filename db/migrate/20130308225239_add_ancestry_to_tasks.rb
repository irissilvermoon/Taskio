class AddAncestryToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :ancestry, :string
    add_index :tasks, :ancestry
  end

  def self.down
    remove_column :tasks, :ancestry
    remove_index :tasks, :ancestry

  end

end
