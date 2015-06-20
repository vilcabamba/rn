class Escenario < ActiveRecord::Base
  enum periodo: [:semanal, :mensual]
  
  begin :relationships
    has_many :butacas
  end

  begin :validations
    validates :uid, presence: true, uniqueness: true
  end
end
