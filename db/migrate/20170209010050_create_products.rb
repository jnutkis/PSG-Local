class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :url
      t.references :vendor, foreign_key: true
    end
  end
end
