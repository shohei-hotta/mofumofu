class Property < ApplicationRecord
  has_many :near_stations, dependent: :destroy
  accepts_nested_attributes_for :near_stations, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true
  validates :rent, presence: true, numericality: true
  validates :address, presence: true, uniqueness: true
  validates :age, presence: true, numericality: true
end
