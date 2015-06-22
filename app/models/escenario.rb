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
