class AddPhoneToLead < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :phone, :string
  end
end
