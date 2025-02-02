class UpdateUsersForUsername < ActiveRecord::Migration[8.0]
  def change
    # remove_index :users, :email_address
    remove_column :users, :email_address, :string
    remove_column :users, :password_digest, :string

    add_column :users, :username, :string, null: false
    add_index :users, :username, unique: true
  end
end
