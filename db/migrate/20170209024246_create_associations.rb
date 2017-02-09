class CreateAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :associations do |t|
      t.references :reference, foreign_key: true
      t.references :product, foreign_key: true
    end
  end
end
