class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :password
      t.string :email
      t.references :vendor, foreign_key: true
      t.integer :admin
      t.integer :superuser
    end
  end
end
