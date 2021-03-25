LICENSE_PLATE_REGEX = /\A[0-9]{2}-[A-Z]{2}-[0-9]{2}/

class Car < ApplicationRecord
  belongs_to :model
  has_many :subscriptions, dependent: :destroy

  validates :year,
            :color,
            :license_plate,
            :price, presence: true

  validates_format_of :license_plate, with: LICENSE_PLATE_REGEX

  validates :license_plate, uniqueness: true
  validates :price, numericality: true
end
