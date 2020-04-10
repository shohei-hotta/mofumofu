class Property < ApplicationRecord
  has_many :near_stations

  validates :name, presence: true
  validates :rent, presence: true, numericality: true
  validates :address, presence: true, uniqueness: true
  validates :age, presence: true, numericality: true
end
