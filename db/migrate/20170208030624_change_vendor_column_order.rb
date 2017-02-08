class ChangeVendorColumnOrder < ActiveRecord::Migration[5.0]
  def change
    change_column :vendors, :phone, :string, after: :email
  end
end
