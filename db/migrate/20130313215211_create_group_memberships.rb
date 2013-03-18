class CreateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :group_memberships do |t|
      t.integer :group_id
      t.integer :created_by
      t.integer :user_id
      t.timestamp :created_at
    end
  end
end
