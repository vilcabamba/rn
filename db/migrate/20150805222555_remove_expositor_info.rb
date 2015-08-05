class RemoveExpositorInfo < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string, null: false
    remove_column :expositores, :dni, :string, null: false
    remove_column :expositores, :city, :string
    remove_column :expositores, :mobile, :string
    add_column :expositores, :name, :string, null: false
  end
end
