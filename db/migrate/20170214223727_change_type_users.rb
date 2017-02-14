class ChangeTypeUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :active, :integer, :default => 1, :null => false
    change_column :users, :newpw, :integer, :default => 1, :null => false
  end
end
