class NearStation < ApplicationRecord
  belongs_to :property

  validates :route, presence: true
  validates :name, presence: true
  validates :minute, presence: true , numericality: true
end
