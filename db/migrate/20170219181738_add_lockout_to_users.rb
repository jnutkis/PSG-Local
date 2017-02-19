class AddLockoutToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_fails, :integer, :default => 0
    add_column :users, :locked_at, :datetime
  end
end
