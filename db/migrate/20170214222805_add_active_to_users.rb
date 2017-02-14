class AddActiveToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :active, :integer
    add_column :users, :newpw, :integer
  end
end
