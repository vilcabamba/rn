class MakeExpositorBelongToCategory < ActiveRecord::Migration
  def change
    add_column :expositores, :category_id, :integer, null: false
    add_index :expositores, :category_id
  end
end
