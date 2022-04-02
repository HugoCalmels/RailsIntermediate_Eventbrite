class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendances
  has_many :events, through: :attendances

  validates :first_name, presence: true, on: :update, length: { in: 3..20 }
  validates :last_name, on: :update, length: { in: 3..20 }
  validates :genre, presence: true, on: :update
  validates :age, presence: true, on: :update
  validates :description, on: :update, length: { maximum: 300 }
end
