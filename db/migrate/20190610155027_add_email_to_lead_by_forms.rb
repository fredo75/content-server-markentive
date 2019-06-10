class AddEmailToLeadByForms < ActiveRecord::Migration[5.2]
  def change
    add_column :lead_by_forms, :email, :string
  end
end
