class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.string :full_ref
      t.string :short_ref
      t.text :specification
      t.datetime :updated_at
    end
  end
end
