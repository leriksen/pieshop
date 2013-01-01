class DropUserTypeIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :user_type_id
    add_column :users, :role, :integer 
  end

  def down
    add_column :users, :user_type_id, :integer
    remove_column :users, :role
  end
end
