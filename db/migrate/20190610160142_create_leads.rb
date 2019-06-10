class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :adress
      t.string :adress_2
      t.string :zip
      t.string :city
      t.string :company
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
