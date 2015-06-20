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
