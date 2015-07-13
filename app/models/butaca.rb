# == Schema Information
#
# Table name: butacas
#
#  id             :integer          not null, primary key
#  uid            :string           not null
#  detail         :string
#  price_cents    :integer          default("0"), not null
#  price_currency :string           default("USD"), not null
#  status         :integer          default("0")
#  escenario_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Butaca < ActiveRecord::Base
  begin :relationships
    belongs_to :escenario
  end

  begin :validations
    validates :uid, presence: true, uniqueness: true
    validates :price, presence: true
  end

  begin :attributes
    monetize :price_cents,
             numericality: {
               greater_than_or_equal: 0
             }
  end

  def to_s
    uid
  end

  def destroyable?
    false
  end
end
