class Maker < ApplicationRecord
  has_many :models

  validates :name, uniqueness: true
end
