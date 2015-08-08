# == Schema Information
#
# Table name: expositores
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  tipo_personeria :integer          default("0")
#  country         :string
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  address         :string
#  company         :string
#  web_site        :string
#  photo           :string
#  details         :text
#  interest        :text
#  alcance         :string
#  name            :string           not null
#  category_id     :integer          not null
#  facebook        :string
#  twitter         :string
#  skype           :string
#  instagram       :string
#

class Expositor < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  SOCIAL_NETWORKS = %w(facebook twitter skype instagram)

  enum tipo_personeria: [:natural, :juridica]

  mount_uploader :photo, ExpositorPhotoUploader

  begin :validations
    validates :tipo_personeria, presence: true
    validates :name, presence: true

    # non-sensible
    validates :country, presence: true

    validates :phone, presence: true # (?)
  end
end
