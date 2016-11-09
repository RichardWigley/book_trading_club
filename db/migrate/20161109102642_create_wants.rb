class CreateWants < ActiveRecord::Migration[5.0]
  def change
    create_table :wants do |t|
      t.references :book, foreign_key: true
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
