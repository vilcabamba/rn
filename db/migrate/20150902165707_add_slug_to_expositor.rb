class AddSlugToExpositor < ActiveRecord::Migration
  def change
    add_column :expositores, :slug, :string
    add_index :expositores, :slug, unique: true
  end
end
