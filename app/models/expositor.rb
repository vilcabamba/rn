# == Schema Information
#
# Table name: expositors
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  tipo_personeria :integer          default("0")
#  country         :string
#  city            :string
#  dni             :string           not null
#  phone           :string
#  mobile          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Expositor < ActiveRecord::Base
  belongs_to :user

  begin :validations
    validates :user, presence: true
    validates :tipo_personeria, presence: true
    validates :dni, presence: true, uniqueness: true

    # non-sensible
    validates :country, presence: true
    validates :city, presence: true
    validates :mobile, presence: true

    validates :phone, presence: true # (?)
  end
end
