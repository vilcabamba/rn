class CreateButacas < ActiveRecord::Migration
  def change
    create_table :butacas do |t|
      t.string :uid, null: false
      t.string :detail
      t.monetize :price
      t.integer :status, default: 0
      t.references :escenario, index: true

      t.timestamps null: false
    end
    add_foreign_key :butacas, :escenarios
    add_index :butacas, :uid
  end
end
