class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  begin :relationships
    has_one :expositor, dependent: :destroy
  end

  begin :validations
    validates :name, presence: true
  end
end
