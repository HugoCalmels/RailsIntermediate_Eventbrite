class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :organizer, class_name: 'User'

  validates :duration, presence: true
  validates :title, presence: true, length: { in: 3..30 }
  validates :start_date, presence: true
  validates :start_hour, presence: true
  validates :location, presence: true, length: { in: 3..30 }
  validates :price, presence: true
  validates :description, length: { maximum: 300 }

  has_one_attached :avatar
end



