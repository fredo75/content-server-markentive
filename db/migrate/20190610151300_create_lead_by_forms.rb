class CreateLeadByForms < ActiveRecord::Migration[5.2]
  def change
    create_table :lead_by_forms do |t|
      t.string :first_name
      t.string :last_name
      t.string :adress
      t.string :adress_2
      t.string :zip
      t.string :city
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
