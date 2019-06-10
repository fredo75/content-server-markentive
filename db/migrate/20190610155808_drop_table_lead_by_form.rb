class DropTableLeadByForm < ActiveRecord::Migration[5.2]
  def change
    drop_table :lead_by_forms
  end
end
