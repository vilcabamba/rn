class AddMissingFieldsInExpositor < ActiveRecord::Migration
  def change
    add_column :expositores, :address, :string
    add_column :expositores, :company, :string
    add_column :expositores, :web_site, :string
    add_column :expositores, :photo, :string
    add_column :expositores, :details, :text
    add_column :expositores, :section, :string
    add_column :expositores, :interest, :text
    add_column :expositores, :alcance, :string
  end
end
