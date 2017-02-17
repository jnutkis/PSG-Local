class ChangeColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :active, :integer, :default => 0, :null => false
  end
end
