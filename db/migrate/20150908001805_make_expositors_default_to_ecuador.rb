class MakeExpositorsDefaultToEcuador < ActiveRecord::Migration
  def change
    change_table :expositores do |t|
      t.change :country, :string, default: "EC"
    end
  end
end
