class CreateEscenarios < ActiveRecord::Migration
  def change
    create_table :escenarios do |t|
      t.string :uid, null: false
      t.integer :periodo, default: 0

      t.timestamps null: false
    end
    add_index :escenarios, :uid
  end
end
