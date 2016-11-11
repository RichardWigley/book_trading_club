class CreateTrades < ActiveRecord::Migration[5.0]
  def change
    create_table :trades do |t|
      t.references :offer, foreign_key: true, null: false
      t.references :want, foreign_key: true, null: false

      t.timestamps
    end
  end
end
