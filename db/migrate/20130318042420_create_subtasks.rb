class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.datetime :created_at
      t.references :task

      t.timestamps
    end
    add_index :subtasks, :task_id
  end
end
