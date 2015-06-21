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
