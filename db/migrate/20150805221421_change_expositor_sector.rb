class ChangeExpositorSector < ActiveRecord::Migration
  def change
    remove_column :expositores, :section, :string
    add_column :expositores, :section_id, :integer
  end
end
