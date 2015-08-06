class AddSocialNetworksToExpositor < ActiveRecord::Migration
  def change
    add_column :expositores, :facebook, :string
    add_column :expositores, :twitter, :string
    add_column :expositores, :skype, :string
    add_column :expositores, :instagram, :string
  end
end
