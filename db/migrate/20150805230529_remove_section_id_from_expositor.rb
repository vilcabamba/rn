class RemoveSectionIdFromExpositor < ActiveRecord::Migration
  def change
    remove_column :expositores, :section_id, :integer
  end
end
