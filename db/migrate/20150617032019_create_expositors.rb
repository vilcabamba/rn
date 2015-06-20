class CreateExpositors < ActiveRecord::Migration
  def change
    create_table :expositors do |t|
      t.references :user, index: true
      t.integer :tipo_personeria, default: 0
      t.string :country
      t.string :city
      t.string :dni, null: false
      t.string :phone
      t.string :mobile

      t.timestamps null: false
    end
    add_foreign_key :expositors, :users
    add_index :expositors, :dni
  end
end
