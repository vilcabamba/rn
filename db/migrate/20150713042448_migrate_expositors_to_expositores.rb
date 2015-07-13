class MigrateExpositorsToExpositores < ActiveRecord::Migration
  def change
    rename_table :expositors, :expositores
  end
end
