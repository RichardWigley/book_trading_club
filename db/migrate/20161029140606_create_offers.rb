class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.references :account, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
