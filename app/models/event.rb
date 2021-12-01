class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :organizer, class_name: 'User'

  validates :duration, presence: true
  validates :title, presence: true
  validates :start_date, presence: true
  validates :start_hour, presence: true
  validates :location, presence: true
  validates :price, presence: true
end



