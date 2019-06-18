class AddColumnToLead < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :rgpd, :boolean
  end
end
