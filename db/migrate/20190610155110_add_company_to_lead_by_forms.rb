class AddCompanyToLeadByForms < ActiveRecord::Migration[5.2]
  def change
     add_column :lead_by_forms, :company, :string
  end
end
