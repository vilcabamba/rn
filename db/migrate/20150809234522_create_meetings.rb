class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :source_id, null: false
      t.integer :target_id, null: false
      t.string :time, null: false
      t.integer :status, null: false, default: 0

      t.timestamps null: false
    end
    add_index :meetings, :source_id
    add_index :meetings, :target_id
  end
end
