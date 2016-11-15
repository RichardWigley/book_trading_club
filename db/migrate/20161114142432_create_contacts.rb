class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.references :account, foreign_key: true
      t.string :full_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :town
      t.string :county
      t.string :postcode

      t.timestamps
    end
  end
end
