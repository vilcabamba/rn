# == Schema Information
#
# Table name: escenarios
#
#  id         :integer          not null, primary key
#  uid        :string           not null
#  periodo    :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Escenario < ActiveRecord::Base
  enum periodo: [:semanal, :mensual]

  begin :relationships
    has_many :butacas, dependent: :destroy
  end

  begin :validations
    validates :uid, presence: true, uniqueness: true
  end

  def to_s
    uid
  end
end
