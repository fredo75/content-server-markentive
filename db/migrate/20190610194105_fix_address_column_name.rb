class FixAddressColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :leads, :adress_2, :address_2
  end
end
