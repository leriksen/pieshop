class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.references :user_type

      t.timestamps
    end
    add_index :users, :user_type_id
  end
end
