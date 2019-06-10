class FixAdressColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :leads, :adress, :address
  end
end
